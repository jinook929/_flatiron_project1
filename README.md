# Country Info CLI App
by Jinook Jung
* * * * * * * * * *
## To Use the App
### via repl.it
1. Visit my [repl.it](https://repl.it/@JinookJung/Country-Info-CLI-App). 
2. Click the Green Play Button. (Ignore errors when starting.)
3. Execute `gem install --user-install httparty colorize`. [This one could take some time]
4. Then, run `ruby bin/run`.

### via Github Repo (For this, you need your Google Geocoding API key.)

1. Visit my [Github repository](https://github.com/jinook929/_flatiron_project1) and clone the code to your local directory. [`git clone https://github.com/jinook929/_flatiron_project1.git`]
2. Enter into the *_flatiron_project1* fold: `cd _flatiron_project1`.
3. Open weather_api_scraper.rb file and change line 8" as below:
api_key = ENV["API_KEY"] api_key => api_key = "**Your Google Geocoding API key**" (Don't forget the quotation marks!!!)
4. Execute `bundle install`.
5. Then, run `ruby bin/run`.

=> This Github version will show you one more info on the weather than repl.it one. [Area Name]

## How to use Country Info CLI App

### Welcome screen (Alphabetical Range List)
**Welcome to Country Info CLI App!**

||  1. A-B  ||  2. C-D  ||  3. E-G  ||  4. H-K  ||\
||  5. L-M  ||  6. N-R  ||  7. S-T  ||  8. U-Z  ||\
**What is the first letter of the country that you are looking for?**

- *When the input is not valid*

**Please see the alphabet list and enter a number between 1 and 8 (or a single letter).**\
||  1. A-B  ||  2. C-D  ||  3. E-G  ||  4. H-K  ||\
||  5. L-M  ||  6. N-R  ||  7. S-T  ||  8. U-Z  ||\
**What is the first letter of the country that you are looking for?**

### Country List Screen Sample
**Which country do you want to know about?**

|  1. Uganda                2. Ukraine               3. United Arab Emirates  4. United Kingdom        5. United States\
|  6. Uruguay               7. Uzbekistan            8. Vanuatu               9. Venezuela             10. Vietnam\
| 11.  Virgin Islands      12. Wallis and Futuna    13. Western Sahara       14. Yemen                15. Zambia\
| 16.  Zimbabwe

**Enter the number of your choice =>**

### Country Info Screen Sample
===   United States   ===

- Capital City: Washington, DC
- Language: English
- Population: 307,212,123
- Currency: USD (US dollar)
- Background:\
Britain's American colonies broke with the mother country in 1776 and were recognized as the new nation of the United States of America following the Treaty of Paris in 1783. During the 19th and 20th centuries, 37 new states were added to the original 13 as the nation expanded across the North American continent and acquired a number of overseas possessions. The two most traumatic experiences in the nation's history were the Civil War (1861-65), in which a northern Union of states defeated a secessionist Confederacy of 11 southern slave states, and the Great Depression of the 1930s, an economic downturn during which about a quarter of the labor force lost its jobs. Buoyed by victories in World Wars I and II and the end of the Cold War in 1991, the US remains the world's most powerful nation state. The economy is marked by steady growth, low unemployment and inflation, and rapid advances in technology.\
 => More Info: http://www.geognos.com/geo/en/cc/us.html

**Do you want to know the currunt weather of this country? [Capital Area] (Y/N)**\
=> *If you choose "Y" or "YES" (case-insensitive), you will see the weather info screen for the capital area of the country.*

### Weather Info Screen Sample
Do you want to know the currunt weather of this country? [Capital Area] (Y/N) **yes**\
Temperature =  37˚F (Feels Like: 30˚F) / Wind = 11 mph\
Daily Low & High =  Low: 29˚F - High: 42˚F / Clear throughout the day

**Do you want to know about another country? (Y/N)**\
=> *If you choose "Y" or "YES" (case-insensitive), the app will lead you to the beginning (the alphabet range list).*

### Ending Screen
****************************

Thank you for using our app!

~ ~ ~  See you later.  ~ ~ ~

****************************

## Data Sources and Structure

### Country Info & Weather Info (by sources)
- [World Countries API](http://www.geognos.com/geo/en/world-countries-API.html)
- Scraping of Country Details Web Pages (e.g. [Korea](http://www.geognos.com/geo/en/cc/kr.html))
- Scraping of Weather Info Website ([Dark Sky](https://darksky.net/forecast/37,127.3/) [with latitude & longitude info of the country])

### Object Keys (sorted by classes & sources)
- **Country** (*basics*) [Country API] :name, :capital, :url, :lat, :long
- **Country** (*details*) [Country SCRAPING] :location, :language, :population, :currency,:background(*, and sometimes* :capital)
- **Weather** [Weather SCRAPIING] :temperature, :feels, :wind, :summary

## References

### Module Sections
- getting-remote-data-working-with-apis 
- oo-student-scraper 
- scraping-flatiron-code-along
- scraping-kickstarter
- weather-app
- worlds-best-restaurants-cli-gem 

### Web Resources
- Colorize [Docs](https://github.com/fazibear/colorize)
- HTTParty [Docs](https://github.com/jnunemaker/httparty/tree/master/docs)
- Nokogiri [Docs](label-Parsing+and+Querying)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jinook929/_flatiron_project1. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Contributors
- Jinook Jung <jinook929@gmail.com>

## License & Copyright
© Jinook Jung

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).