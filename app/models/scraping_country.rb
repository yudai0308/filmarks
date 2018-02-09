class Scraping_country
  def self.info_country
    agent = Mechanize.new
    current_page = agent.get("https://filmarks.com/list/country/")
    elements = current_page.search('.c-search-panel__links--5col li a')

    elements.each do |ele|
      name = ele.inner_text
      country = Country.new(name: name)
      country.save
    end
  end
end
