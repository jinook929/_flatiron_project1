# Require gems needed
require "pry"
require "httparty"
require "nokogiri"
require "open-uri"
require "json"
require "colorize"

# Require all .rb files in lib folder
Dir['./lib/*.rb'].each {|file| require_relative ".#{file}"}
