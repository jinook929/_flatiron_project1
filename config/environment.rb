require "pry"
require "httparty"
require "nokogiri"
require "open-uri"
require "json"
require "colorize"

Dir["../lib/*.rb"].each { |file| require file }