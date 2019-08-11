require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'pry'

require_relative "PoliceStation_List/version"
require_relative "./PoliceStation"
require_relative "./CLI"
require_relative "./Scraper"

module PoliceStationList
  class Error < StandardError; end
end
