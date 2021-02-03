class Cli
    # Welcomes a user and invoke start method
    def welcome
        puts "\nWelcome to Country Info CLI App!"
        self.start
    end

    # Show alphabet list and check if user input is valid
    def start
        puts "\n1. A-B\s\s||\s\s2. C-D\s\s||\s\s3. E-G\s\s||\s\s4. H-K\s\s||\s\s5. L-M\s\s||\s\s6. N-R\s\s||\s\s7. S-T\s\s||\s\s8. U-Z".colorize(:light_green)
        print "What is the first letter of the country that you are looking for?\s"
        input = gets.strip
        # Check if user input is valid
        if !input.match(/^[1-8A-Za-z]$/) # If not valid, ask again
            puts "\nPlease see the alphabet lists and enter a number between 1 and 8 (or a single letter)."
            self.start 
        else                             # If valid, print countries list for the alphabet range
            self.print_countries(input)
        end
        # When finished with one cycle, ask user to continue or to exit
        self.another_country     
    end

    # Show countries list of the selected alphabet range
    def print_countries(input)
        case input
        when /^[1AaBb]/ # When a-b
            # Create regex pattern for selected alphabet range
            pattern = /^[AaBb]/
            # Collect data for selected alphabet range
            country_selection(input, pattern)
        when /^[2CcDd]/ # When c-d
            pattern = /^[CcDd]/
            country_selection(input, pattern)
        when /^[3E-Ge-g]/ # When e-g
            pattern = /^[E-Ge-g]/
            country_selection(input, pattern)
        when /^[4H-Kh-k]/ # When h-k
            pattern = /^[H-Kh-k]/
            country_selection(input, pattern)
        when /^[5LlMm]/ # When l-m
            pattern = /^[LlMm]/
            country_selection(input, pattern)
        when /^[6N-Rn-r]/ # When n-r
            pattern = /^[N-Rn-r]/
            country_selection(input, pattern)
        when /^[7SsTt]/ # When s-t
            pattern = /^[SsTt]/
            country_selection(input, pattern)
        when /^[8U-Zu-z]/ # when u-z
            pattern = /^[U-Zu-z]/
            country_selection(input, pattern)
        else # When user input is not valid
            # Invoke start method again
            self.start
        end
    end
end