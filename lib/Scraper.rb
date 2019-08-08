require 'nokogiri'
require 'open-uri'
require 'colorize'

class PoliceStationScraper
  BASE_URL = 'https://www.policeone.com/law-enforcement-directory/'

  def self.scrape_station_list
    pg = open(BASE_URL)
    doc = Nokogiri.HTML(pg)
    station_list = doc.css(".Table-body .Table-link").map(&:text)
    link_list = doc.css("a[class=Table-row]").map{|link| link["href"]}
    station_list.each_with_index do |station, index|
    policestation = station.new
    policestation.name = station
    policestation.url = link_list[index]
    end
    # station_list =
    # parsed_html.css ("a")
    # station_list.each do |a|
    #   name: a.css('Table-row Table-row--highlight a').text.strip,
    #   url: a.css('a')[0].attr('href')
    # end
  end
  #  html = open("https://www.policeone.com/law-enforcement-directory/")
  #  doc = Nokogiri::HTML(html)

  #  policestation_list = doc.css("")

    #policestation_list.drop(2).each do |policestation|
    #  station = PoliceStation.new
    #  station.name = policestation.css("a").text
    #  station.url = policestation.css("a").attr('href').value
    #  end
    #end
  def self.scrape_station_details(station)
    pg = open("https://www.policeone.com#{station.url}")
    doc = Nokogiri.HTML(pg)
  end
end
