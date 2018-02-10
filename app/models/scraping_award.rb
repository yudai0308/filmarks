class Scraping_award
  def self.info_award
    lists = []
    agent = Mechanize.new
    page = agent.get("https://filmarks.com/list/award")
    mains = page.search('dt a')

    mains.each do |main|
      name = main.inner_text
      url = main.get_attribute('href')
      main = { name:name, url:url }
      lists << main
    end
    info_subtitle(lists)
  end

  def self.info_subtitle(lists)
    agent = Mechanize.new
    page = agent.get('https://filmarks.com/list/award')
    subs = page.search('dd ul li a')
    subs.each do |sub|
      subname = sub.inner_text
      url_sub = sub.get_attribute('href')
      lists.each do |list|
        if url_sub == list[:url] || url_sub.match(/#{ list[:url] }\//)
          award = Award.new(name: list[:name], subname: subname)
          award.save
        end
      end
    end
  end
end
