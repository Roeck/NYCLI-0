class NYCLI::Scraper
  attr_accessor :url

  def initialize(url = "https://www.nyc.com/events/?int4=5")
    @url = url
  end

  def get_page
    Nokogiri::HTML(open(self.url))
  end

  def get_events
    self.get_page.css(".eventrecords li[itemtype='http://schema.org/Event']")
  end

  # Scraping events by elements:

  def show_events
    self.get_events.each do |item|
      event = NYCLI::Event.new
      event.name = item.css("h3").text.strip
      event.date = item.css(".desktop-date").text.gsub("\n                    ", ' ').strip
      event.time = item.css(".datevenue strong.nyc-mobile-hidden").text
      event.description = item.css("p[itemprop='description']").text.gsub("read more", '').strip
      event.venue = item.css("span[itemprop='name']").text
      event.link = "https://www.nyc.com" + item.css("a.venuelink").attr("href").text if item.css("a.venuelink").attr("href")
    end
  end

  def show_events
    self.get_events.each do |item|
      event = NYCLI::Event.new
      event.name = item.css("h3").text.strip
      event.date = item.css(".desktop-date").text.gsub("\n                    ", ' ').strip
      event.time = item.css(".datevenue strong.nyc-mobile-hidden").text
      event.description = item.css("p[itemprop='description']").text.gsub("read more", '').strip
      event.venue = item.css("span[itemprop='name']").text
      event.link = "https://www.nyc.com" + item.css("a.venuelink").attr("href").text if item.css("a.venuelink").attr("href")
    end
  end

  def self.page
    @@page
  end

  # Events re-iteration:

  def self.more
    @@page += 1
    NYCLI::Scraper.new("https://www.nyc.com/events/?int4=5&p=" + "#{self.page}").show_events
    NYCLI::Event.more_names
  end
  
end
