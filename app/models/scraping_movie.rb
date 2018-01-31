class Scraping_movie
  def self.movie_urls_2010s
    links = []
    agent = Mechanize.new
    detail_url = ""
    current_page = agent.get("https://filmarks.com/list/year/2010s?page=1")
    elements = current_page.search(".p-movie-cassette__readmore")

    elements.each do |ele|
      links << ele.get_attribute("href")
    end

    # movie情報のクレイピング
    links.each do |link|
      get_movie_info("https://filmarks.com" + link)
    end

    # member情報のスクレイピング
    links.each do |link|
      get_movie_members("https://filmarks.com" + link)
    end
  end

  def self.get_movie_info(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at(".p-movie-detail__title span").inner_text if page.at(".p-movie-detail__title span")
    subtitle = page.at(".p-movie-detail__original").inner_text if page.at(".p-movie-detail__original")
    image = page.at(".c-movie__jacket img")[:src] if page.at(".c-movie__jacket img")[:src]
    time = page.search(".p-movie-detail__other-info-title").text.match(/時間：.+/).to_s if page.at(".p-movie-detail__other-info-title")
    story = page.at(".p-movie-detail__synopsis-desc").inner_text if page.at(".p-movie-detail__synopsis-desc")
    production = page.at(".p-movie-detail__title small a").inner_text if page.at(".p-movie-detail__title small a")
    release = page.search(".p-movie-detail__other-info-title").text.match(/上映日：.+日/).to_s if page.at(".p-movie-detail__other-info-title")
    movie = Movie.where(title: title, subtitle: subtitle, image: image, time: time, story: story, production: production, release: release).first_or_initialize
    movie.save
  end

  def self.get_movie_members(link)
    agent = Mechanize.new
    page = agent.get(link)
    member_first = page.search(".p-movie-detail__people-list-others")

    # 監督、脚本のスクレイピング
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
