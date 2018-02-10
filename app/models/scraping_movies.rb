class Scraping_movies
  def self.select_year
    # 年代の選択
    while true do
      puts "どの年代の映画、キャスト情報を取得しますか？（それぞれ20件ずつ）"
      puts "[1] 2010年代\n[2] 2000年代\n[3] 1990年代\n[4] 1980年代\n[5] 1970年代\n[6] 終了する"
      input = gets.to_i
      if input == 1
        year = "2010"
        get_urls(year)
      elsif input == 2
        year == "2000"
        get_urls(year)
      elsif input == 3
        year = "1990"
        get_urls(year)
      elsif input == 4
        year = "1980"
        get_urls(year)
      elsif input == 5
        year = "1970"
        get_urls(year)
      elsif input == 6
        exit
      else
        puts "無効な入力だっちゃ"
      end
    end
  end

  def self.get_urls(year)
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://filmarks.com/list/year/#{year}s?page=1&view=poster")
    elements = current_page.search(".c-movie-item")
    # 各映画のURLを取得
    elements.each do |ele|
      links << ele.children.at("a").get_attribute("href")
    end
    binding.pry

    # movie情報のスクレイピング
    links.each do |link|
      # binding.pry
      get_movie_info("https://filmarks.com" + link)
    end
    binding.pry

    # member情報のスクレイピング
    links.each do |link|
      get_movie_members("https://filmarks.com" + link)
    end
  end

  # movie情報の取得と保存
  def self.get_movie_info(link)
    agent = Mechanize.new
    page = agent.get(link)
    # binding.pry

    image = page.at(".c-movie__jacket img")[:src] if page.at(".c-movie__jacket img")[:src]
    title = page.at(".p-movie-detail__title span").inner_text if page.at(".p-movie-detail__title span")
    subtitle = page.at(".p-movie-detail__original").inner_text if page.at(".p-movie-detail__original")
    production = page.at(".p-movie-detail__title small a").inner_text if page.at(".p-movie-detail__title small a")
    release = get_release_or_time(link)
    time = get_release_or_time(link)
    story = page.at(".p-movie-detail__synopsis-desc").inner_text if page.at(".p-movie-detail__synopsis-desc")
    # binding.pry

    movie = Movie.where(title:      title,
                        subtitle:   subtitle,
                        image:      image,
                        time:       time,
                        story:      story,
                        production: production,
                        release:    release).first_or_initialize
    movie.save
  end

  # release と time の情報所得と編集
  def self.get_release_or_time(link)
    agent = Mechanize.new
    page = agent.get(link)
    class_name = "p-movie-detail__other-info-title"
    more_infos = page.search(".#{class_name}")
    more_infos.each do |info|
      if info.children.inner_text.include?("上映日")
        release = info.children.inner_text
        edited_release = release.gsub(/上映日：|年|月|日/, "上映日：" => "", "年" => "-", "月" => "-", "日" => "")
        return edited_release
      end
      if info.children.inner_text.include?("上映時間")
        time = info.children.inner_text
        edited_time = time.gsub(/上映時間：|分/, "上映時間：" => "", "分" => "")
        return edited_time
      end
    end
  end

  # 監督、脚本のスクレイピング
  def self.get_movie_members(link)
    agent = Mechanize.new
    page = agent.get(link)
    member_first = page.search(".p-movie-detail__people-list-others")

    member_first.each do |mem|
      case mem.search(".p-movie-detail__people-list-term").inner_text
      when "監督" then
        directors = mem.search(".p-movie-detail__people-list-desc")
        directors.each do |director|
          director_name = director.search(".c-label").inner_text if director.search(".c-label")
          member = Member.where(status: "0", name: director_name).first_or_initialize
          member.save
        end
      when "脚本" then
        wrighters = mem.search(".p-movie-detail__people-list-desc")
        wrighters.each do |wrighter|
          wrighter_name = wrighter.search(".c-label").inner_text if wrighter.search(".c-label")
          member = Member.where(status: "1", name: wrighter_name).first_or_initialize
          member.save
        end
      end
    end

    # キャストのスクレイピング
    member_second = page.search(".p-movie-detail__people-list-casts")
    casts = member_second.search(".p-movie-detail__people-list-desc")

    casts.each do |cast|
      cast_name = cast.search(".c-label").inner_text if cast.search(".c-label").inner_text
      cast = Member.where(status: "2", name: cast_name).first_or_initialize
      cast.save
    end
  end
end
