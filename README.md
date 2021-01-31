# First screen (Alphabetical Divisions)
Choose one of the options for a country to know about.
1. A-B
2. C-D
3. E-G
4. H-K
5. L-M
6. N-R
7. S-T
8. U-Z

# Basic Country Info: [World Countries API](http://www.geognos.com/api/en/countries/info/all.json)
1. name [API]
2. capital [API]
3. location [SCRAPING]
4. language [SCRAPING]
5. population [SCRAPING]
6. currency [SCRAPING]
---
# Detailed Country Info
7. background[SCRAPING]
8. url (detailed country info) [API] (e.g. [Korea](http://www.geognos.com/geo/en/cc/kr.html))
9. current weather @capital (w/GeoPt[API] => [Dark Sky](https://darksky.net/forecast/37,127.3/)[SCRAPING]): 
temperature, feels, wind, summary

# Data Sources
=> [CountryAPI] :name, :capital, :url, :lat, :long
=> [CountrySCRAPING] :location, :language, :population, :currency,:background,
=> [WeatherSCRAPIING]:temperature, :feels, :wind, :summary

# References
- oo-student-scraper Folder
- worlds-best-restaurants-cli-gem Folder
- getting-remote-data-working-with-apis Folder
- HTTParty [Docs](https://github.com/jnunemaker/httparty/tree/master/docs)