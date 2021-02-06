class Cli
  # Welcomes a user and invoke start method
  def welcome
    puts "\nWelcome to Country Info CLI App!\n".colorize(:light_red)
    self.start
  end

  # Show alphabet list and check if user input is valid
  def start
    puts "||  1. A-B  ||  2. C-D  ||  3. E-G  ||  4. H-K  ||\n||  5. L-M  ||  6. N-R  ||  7. S-T  ||  8. U-Z  ||".colorize(:light_green)
    print "What is the first letter of the country that you are looking for?\s"
    input = gets.strip
    # Check if user input is valid
    if !input.match(/^[1-8A-Za-z]$/) # If not valid, ask again
      puts "\nPlease see the alphabet list and enter a number between 1 and 8 (or a single letter).".colorize(:light_black)
      self.start
    else # If valid, print countries list for the alphabet range
      self.print_countries(input)
    end
    # When finished with one cycle, ask user to continue or to exit
    self.another_country?
  end

  # Show countries list of the selected alphabet range
  def print_countries(input)
    case input
    when /^[1AaBb]/ # When a-b
      # Create regex pattern for selected alphabet range
      pattern = /^[AaBb]/
      # Collect data for selected alphabet range
      self.country_selection(input, pattern)
    when /^[2CcDd]/ # When c-d
      pattern = /^[CcDd]/
      self.country_selection(input, pattern)
    when /^[3E-Ge-g]/ # When e-g
      pattern = /^[E-Ge-g]/
      self.country_selection(input, pattern)
    when /^[4H-Kh-k]/ # When h-k
      pattern = /^[H-Kh-k]/
      self.country_selection(input, pattern)
    when /^[5LlMm]/ # When l-m
      pattern = /^[LlMm]/
      self.country_selection(input, pattern)
    when /^[6N-Rn-r]/ # When n-r
      pattern = /^[N-Rn-r]/
      self.country_selection(input, pattern)
    when /^[7SsTt]/ # When s-t
      pattern = /^[SsTt]/
      self.country_selection(input, pattern)
    when /^[8U-Zu-z]/ # when u-z
      pattern = /^[U-Zu-z]/
      self.country_selection(input, pattern)
    else # When user input is not valid
      # Invoke start method again
      self.start
    end
  end

  # Print countries of selected range and receive user input for specific country;
  # then check if the input is valid and collect the basic data for the country
  def country_selection(input, pattern)
    # Get countries basic info via API
    countries_info = CountryApiScraper.get_countries_info
    puts "\nWhich country do you want to know about?"
    # Choose the matching countries info
    countries = countries_info.select { |info| info[:name].match(pattern) }
    # Prepare starting index for the selected range
    starting_index = countries_info.index(countries[0])
    # Print countries list of the range
    countries.each.with_index { |country, i|
      if (i + 1) % 5 == 1
        puts ""
      end
      print "#{i + 1}. #{country[:name]} ".slice(0, 23).ljust(25, " ").colorize(:light_cyan)
    }
    print "\n\nEnter the number of your choice => "
    # Receive user input and convert the index in context of all countries
    country_index = gets.strip.to_i - 1 + starting_index
    # Check on the validity of user input
    if (starting_index..countries.count - 1 + starting_index).include?(country_index) # When valid
      # Collect data for instance of the selected country
      country_code = countries_info[country_index][:code]
      country_lat = countries_info[country_index][:lat]
      country_long = countries_info[country_index][:long]
      # Print country info by invoking print_country method
      self.print_country(country_code)
      # Ask optional question on weather info by invoking ask_weahter method
      self.ask_weather(country_lat, country_long)
    else # When not valid
      # Show countries list in the range and ask user again for the selection
      self.print_countries(input)
    end
  end

  # Print selected country info
  def print_country(country_code)
    # Get detailed country info via scraping
    country_hash = CountryApiScraper.get_country_info(country_code)
    # Check if the instance exists and assign it or a new instance to a variable
    country = Country.all.find { |country| country.code == country_code } || Country.new(country_hash)
    # Print country info to user
    puts "\n===   #{country.name}   ===".colorize(:red).underline.bold
    puts "\n- Capital City: #{country.capital}"
    puts "- Language: #{country.language}"
    puts "- Population: #{country.population}"
    puts "- Currency: #{country.currency}"
    puts "- Background: \n#{country.background}".colorize(:light_blue)
    puts "\s=> More Info: #{country.url}".colorize(:green)
  end

  # Ask user if weather info needed
  def ask_weather(lat, long)
    print "\nDo you want to know the currunt weather of this country? [near capital area] (Y/N)\s"
    # Get user input and check if it is valid
    input = gets.strip
    if !input.match(/(^[yn]$|^yes$|^no$)/i) # When invalid
      self.ask_weather(lat, long)
    else # When valid
      if input.match(/(^[y]$|^yes$)/i) # When yes
        # Get weather info via scraping
        weather_hash = WeatherApiScraper.get_weather_info(lat, long)
        # Instantiate Weather object
        country_weather = Weather.new(weather_hash)
        # Print weather info
        ### trying area name: 
        puts "[   AREA : #{country_weather.area} (around the capital)   ]".colorize(:light_green)
        print "Temperature =  #{country_weather.degree} (#{country_weather.feels_like})".ljust(45, " ").colorize(:yellow)
        puts "/   Wind = #{country_weather.wind}".colorize(:yellow)
        print "Daily Low & High =  #{country_weather.low_high}".ljust(45, " ").colorize(:yellow)
        puts "/   #{country_weather.description}".colorize(:yellow)
      else # When no
        # Ask if user want to continue the app
        self.another_country?
      end
    end
  end

  # Ask user for the app to be continued
  def another_country?
    print "\nDo you want to know about another country? (Y/N)\s"
    # Get user input
    another = gets.strip
    # Check if input is valid
    if !another.match(/(^[yn]$|^yes$|^no$)/i) # When invalid
      # Ask again
      another_country?
    else # When valid
      if another.match(/(^[y]$|^yes$)/i) # When yes
        # Invoke start method
        puts ""
        self.start
      else # When no
        # Invoke exit method
        puts ""
        self.exit
      end
    end
  end

  # Exit the app with message
  def exit
    message = <<~HEREDOC
    
      * * * * * * * * * * * * * * *

      Thank you for using our app !

      ~ ~ ~   See you later   ~ ~ ~

      * * * * * * * * * * * * * * *
      
      HEREDOC
    abort(message.colorize(:light_magenta))
  end
end
