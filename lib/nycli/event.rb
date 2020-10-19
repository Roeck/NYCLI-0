class NYCLI::Event

  @@blu = "\e[1;34m"
  @@green = "\e[1;32m"
  @@white = "\e[0m"
  
  attr_accessor :name, :date, :day, :time, :venue, :description, :link
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.names
    counter = 1
    self.all.each do |event|
      puts "#{counter}. #{event.name}"
      counter += 1
    end
  end

  def self.more_names
    counter = 1
    # Scraper pulls in 20 items per page
    starter = NYCLI::Scraper.page * 20 - 19 # formula to continue numbering
    more_events = starter

    puts "\n"
    self.all.each do |event|
      event = "#{counter}- #{event.name.upcase}"
      puts event if counter == more_events
      counter += 1
      more_events += 1 if counter > starter
    end
  end

  def self.details(index) #instance method instead
    event = @@all[index]
    puts "\n#{@@blu}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "\n#{@@blu}#{event.name.upcase}\n\n#{@@green}#{event.date} || #{event.time}\n\n@#{event.venue}"
    puts "#{event.description}"
    (event.link != nil) ? (puts "\n#{@@white}To read more or purchase tickets, visit #{event.link}") : (puts "More info To Be Announced")
    puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def self.dates
    counter = 1
    dates = self.all.collect {|event| event.date}
  end

end


