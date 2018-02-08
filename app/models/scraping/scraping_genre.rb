class Scraping_genre
  def self.info_genre
    agent = Mechanize.new
    page = agent.get("https://filmarks.com/list/genre")
    elements = page.search('.c-search-panel__main li a')
    elements.each do |ele|
    Genre.create(name: ele.inner_text)  
    end
  end
end
