class NYCLI::List
  attr_accessor :name
  @@lists = []

  def initialize(name)
    @name = name
    @@lists << self
  end

  def self.view
    counter = 1
    self.lists.each do |list|
      puts "\t#{counter}. #{list.name}"
      counter += 1
    end
  end

end 