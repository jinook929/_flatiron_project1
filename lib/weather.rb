# To create Weather instances
class Weather
    # Initialize a new instance from given hash
    def initialize(hash)
        hash.each {|k, v|
            # Create getters and setters
            self.class.attr_accessor(k)
            # Set value for created variable
            self.send("#{k}=", v)
        }
    end
end
