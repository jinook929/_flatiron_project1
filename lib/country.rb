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
        hash.each {|k, v|
            # Create getters and setters
            self.class.attr_accessor(k)
            # Set value for created variable
            self.send("#{k}=", v)
        }
        @@all.push(self)
    end
end
