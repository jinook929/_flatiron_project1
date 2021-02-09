# To create Country instances
class Country
  # Set class variable to collect the instances
  @@all = []
  
  # Get @@all value
  def self.all
    @@all
  end

  # Initialize a new instance from given hash
  def initialize(hash)
    hash.each { |k, v|
      # Create getters and setters
      self.class.attr_accessor(k)
      # Set value for created variable
      self.send("#{k}=", v)
    }
    self.class.all.push(self)
  end

  # Either find or create Country instance
  def self.find_or_create_by_code(code)
    self.all.find {|country| country.code == code} || Country.new(CountryApiScraper.get_country_info(code))
  end
end
