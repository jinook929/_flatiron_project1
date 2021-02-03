class Cli
    def welcome
        puts "\nWelcome to Country Info CLI App!"
        self.start
    end

    def start
        puts "\n1. A-B\s\s||\s\s2. C-D\s\s||\s\s3. E-G\s\s||\s\s4. H-K\s\s||\s\s5. L-M\s\s||\s\s6. N-R\s\s||\s\s7. S-T\s\s||\s\s8. U-Z".colorize(:light_green)
        print "What is the first letter of the country that you are looking for?\s"
        input = gets.strip
        if !input.match(/^[1-8A-Za-z]$/)
            puts "\nPlease see the alphabet lists and enter a number between 1 and 8 (or a single letter)."
            self.start 
        else
            self.print_countries(input)
        end
        self.another_country     
    end
end