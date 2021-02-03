# Require gems needed
require "pry"
require "httparty"
require "nokogiri"
require "open-uri"
require "json"
require "colorize"

# Require all .rb files in lib folder
# binding.pry
# Dir['./lib/*.rb'].each {|file| require_relative '.#{file}'}
require_relative '../lib/cli'
require_relative '../lib/country'
require_relative '../lib/weather'
require_relative '../lib/country_api_scraper'
require_relative '../lib/weather_scraper'