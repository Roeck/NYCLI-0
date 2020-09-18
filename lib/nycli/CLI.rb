class NYCLI::CLI

  # Color variables:

  @@blu = "\e[1;34m"
  @@green = "\e[1;32m"
  @@white = "\e[0m"
  @@yellow = "\e[1;33m"
  @@red = "\e[1;31m"

  # Menu:

   puts "#{@@blu}
  .~~~~~~~~~~~~~~~~.
  | #{@@yellow}WELCOME TO NYC!#{@@blu}|
  .~~~~~~~~~~~~~~~~.
  #{@@green}\n"

  puts "\n#{@@green}Choose your desired events by their numbers:#{@@white}\n\n"

  today = NYCLI::Scraper.new()
  today.show_events
  NYCLI::Event.names

  # Show more events option:

  def self.user_prompt
    puts "\n#{@@green}To view more events, type 'more'#{@@white}"
  end

  def self.action(input)
    if input == 'more'
      NYCLI::Scraper.more
      NYCLI::CLI.user_prompt

    elsif input.to_i > 0
      if input.to_i <= NYCLI::Event.all.count
        index = input.to_i - 1
        NYCLI::Event.details(index)
      end

    else
      puts "\n#{@@red}Invalid input. Try again!#{@@white}"
    end
  end

  # Exit program:
  
  puts "\n#{@@yellow}Type 'exit' to quit."
  NYCLI::CLI.user_prompt
  input = gets.strip

  while input != 'exit'
    NYCLI::CLI.action(input)
    input = gets.strip
  end
      puts "\n#{@@yellow}Goodbye!#{@@white}\n\n"
end