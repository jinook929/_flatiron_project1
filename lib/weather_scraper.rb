# Get current weather info by scraping (instances not saved for later use)
class WeatherScraper
    # Get weather info from latitude and longitude
    def self.get_weather_info(lat, long)
        # Scrape data from web page
        doc = Nokogiri::HTML(open("https://darksky.net/forecast/#{lat},#{long}/us12/en"))
        # Return weather info hash
        Hash.new.tap {|hash|
            hash[:degree] = doc.css("#title .desc > .swap").text.split(/[[:space:]]/)[0].concat("F")
            hash[:wind] = "#{doc.css(".wind .wind__speed__value").text} mph"
            line = doc.css("#title .desc > .summary-high-low").text.split(/[[:space:]]/)
            line.delete("")
            hash[:feels_like] = "#{line[0]} #{line[1]} #{line[2]}F"
            hash[:low_high] = "#{line[3]} #{line[4]}F - #{line[5]} #{line[6]}F"
            hash[:description] = doc.css("#title .currently__summary").text.strip.gsub(".", "")
        }        
    end
end
