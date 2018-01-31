class Scraping_award

  def self.info_award
    agent = Mechanize.new
    page = agent.get("https://filmarks.com/list/award")
    mains = page.search('dd ul li a')
    mains.each do |main|
      subname = main.inner_text
      puts subname
      award = Award.new(name: "仮name", subname:subname)
      award.save
    end
  end
end




