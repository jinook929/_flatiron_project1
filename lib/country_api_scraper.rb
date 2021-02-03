# Get countries basic info from API and detailed individual country info by scraping
class CountryApiScraper
    # Get countries basic info from API
    def self.get_countries_info
        # Get all the info as hashes from API
        response = HTTParty.get("http://www.geognos.com/api/en/countries/info/all.json")
        doc = JSON.parse(response.body)["Results"].sort_by { |key, value| value["Name"] }
        # Return countries basic info
        doc.collect { |key, value|
            Hash.new.tap { |hash|
              hash[:name] = value["Name"]
              hash[:code] = key.downcase
              hash[:url] = value["CountryInfo"]
              if value["Capital"] # when API has capital info
                hash[:capital] = value["Capital"]["Name"]
                hash[:lat] = value["Capital"]["GeoPt"][0]
                hash[:long] = value["Capital"]["GeoPt"][1]
              else                # when API does not have capital info
                hash[:capital] = "N/A"
                hash[:lat] = value["GeoPt"][0]
                hash[:long] = value["GeoPt"][1]
              end
            }
        }
    end

    # Get detailed individual country info based on given country code by scraping
    def self.get_country_details(code)
        hash = {}
        # Request error check with a web page to scrape
        begin  # when the web page works
            # Get the country page info based on code argument
            doc = Nokogiri::HTML(open("http://www.geognos.com/geo/en/cc/#{code}.html"))
            # Fill in the returning hash
            hash[:location] = doc.css("#Location p").text.chop
            if hash[:capital] == "N/A"
                hash[:capital] = doc.css("#nm_cont_Capital td")[1].text.strip
            end
            hash[:language] = doc.css("#nm_cont_Languages > table > tbody > tr > td")[0].text.strip
            hash[:population] = doc.css("#Population p").text.gsub(/\302\240/, ",").chop
            hash[:currency] = "#{doc.css("#Currencycode p").text.gsub(/[[:space:]]/, "")} (#{doc.css("#Currencyname p").text.gsub(160.chr("UTF-8"), "")})"
            hash[:background] = doc.css("#Background p").text.strip.chop
        rescue # when the web page does not work
            hash[:location] = "N/A"
            hash[:capital] = "N/A"
            hash[:language] = "N/A"
            hash[:population] = "N/A"
            hash[:currency] = "N/A"
            hash[:background] = "'More Info' link below will not work..."
        end
        # Return detailed country info hash
        hash
    end

    # Finalize creating country details hash based on given country code
    def self.get_country_info(code)
        country_basics = self.get_countries_info.select { |obj| obj[:code] == code }[0]
        country_basics.merge(self.get_country_details(code))
    end
end