class NYCLI::CLI

  # Color variables:

  @@white = "\e[0m"
  @@red = "\e[1;31m"
  @@green = "\e[1;32m"
  @@yellow = "\e[1;33m"
  @@blue = "\e[1;34m"

  # Welcoming:

  def self.call
    puts "#{@@blue}
    .~~~~~~~~~~~~~~~~~.
    | #{@@yellow}WELCOME TO NYC!#{@@blue} |
    .~~~~~~~~~~~~~~~~~.
    "
    puts "#{@@green}Select your desired events by their numbers:#{@@white}"

    today = NYCLI::Scraper.new()
    today.show_events
    NYCLI::Event.names

  # Show options:

  def self.user_prompt
    puts "\n\n#{@@yellow}Type 'more' to see more events.#{@@white}\n\n"
    puts "#{@@blue}Type 'back' to return to the initial list.#{@@white}\n\n"
    puts "#{@@red}Type 'exit' to quit the application.#{@@white}\n\n"
  end

  def self.action(input)
    if input == 'more'
      NYCLI::Scraper.more
      NYCLI::CLI.user_prompt

    elsif
      input == 'back'
      NYCLI::Event.names

    elsif input.to_i > 0
      if input.to_i <= NYCLI::Event.all.count
        index = input.to_i - 1
        NYCLI::Event.details(index)
      end

    else
      puts "\n\n#{@@blue}Until next time!#{@@white}"
    end
  end

  # Exit program:
  
  NYCLI::CLI.user_prompt
  input = gets.strip

  while input != 'exit'
    NYCLI::CLI.action(input)
    input = gets.strip
  end
    puts "\n\n#{@@blue}Until next time!#{@@white}"
  end
end