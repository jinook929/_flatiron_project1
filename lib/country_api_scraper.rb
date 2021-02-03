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
end