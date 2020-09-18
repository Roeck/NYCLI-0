class NYCLI::List
  attr_accessor :name
  @@lists = []

  def initialize(name)
    @name = name
    @events = []
    @@lists << self
  end

  def self.view
    counter = 1
    self.lists.each do |list|
      puts "\t#{counter}. #{list.name}"
      counter += 1
    end
  end

def view
    self.events.each do |event|
      puts "\t#{event.name}"
    end
  end

  def add(index)
    @events << NYCLI::Event.all[index]
  end

  def self.lists
    @@lists
  end

  def self.name_lists
    @@lists.each do |list|
      list.name
    end
  end
end