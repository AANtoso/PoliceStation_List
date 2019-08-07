require 'nokogiri'
require 'open-uri'

class PoliceStationScraper
  BASE_URL = 'https://www.policeone.com/law-enforcement-directory/'

  def self.scrape_policestationlist
    pg = open(BASE_URL)
    parsed_html = Nokogiri.HTML(pg)
    station_list =
    parsed_html.css ("a")
    station_list.each do |a|
      name: a.css('Table-row Table-row--highlight a').text.strip,
      url: a.css('a')[0].attr('href')
  #  html = open("https://www.policeone.com/law-enforcement-directory/")
  #  doc = Nokogiri::HTML(html)

  #  policestation_list = doc.css("")

    #policestation_list.drop(2).each do |policestation|
    #  station = PoliceStation.new
    #  station.name = policestation.css("a").text
    #  station.url = policestation.css("a").attr('href').value
    #  end
    #end
    #def self.scrape_policestation_specifications(policestation)
    #  html = open()
    #end

  end
