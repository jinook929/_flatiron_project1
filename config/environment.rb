# Require gems needed
# require "pry"
require 'dotenv'
Dotenv.load('./.env')

require "httparty"
require "nokogiri"
require "open-uri"
require "json"
require "colorize"
require "csv"
# require 'geocoder' <= for repl.it version

# Require all .rb files in lib folder
Dir["./lib/*.rb"].each { |file| require_relative ".#{file}" }
