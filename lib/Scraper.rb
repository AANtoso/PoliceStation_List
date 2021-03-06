class PoliceStationScraper
  BASE_URL = 'https://www.policeone.com/law-enforcement-directory/'

  def self.scrape_station_list
    pg = open(BASE_URL)
    doc = Nokogiri.HTML(pg)
    station_list = doc.css(".Table-body .Table-link").map(&:text)
    link_list = doc.css(".Table-row").map{|link| link["href"]}
    station_list.each.with_index(1) do |station, index|
    policestation = PoliceStation.new
    policestation.name = station
    policestation.url = link_list[index]
    end
  end
  def self.scrape_station_details(station)
    pg = open("https://www.policeone.com#{station.url}")
    doc = Nokogiri.HTML(pg)
    details = doc.css("dd[class=DefList-description]")
    station.country = details[0].text
    station.address = details[1].text
    station.city = details[2].text
    station.state = details[3].text
    station.zipcode = details[4].text
  end
end
