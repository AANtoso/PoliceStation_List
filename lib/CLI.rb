class CLI

  def call
    puts "Welcome Citizens!"
    puts "Here is a list of Police Stations."
    puts " "
        puts "----------------------------------"
        puts " "
        PoliceStationScraper.scrape_station_list
        print_station
        pick_your_station
        Station.find_all_by_name("")
      end


      def pick_your_station

        input = ""
        while input != "exit" do

          puts "Choose your station!"
          puts "Enter a number for more information or type 'exit' to exit."
          puts " "

          input = gets.strip.downcase

          if (1..Station.all.count).include?(input.to_i)
            PoliceStationScraper.scrape_station_details(Station.all[input.to_i-1]) if !Station.all[input.to_i-1].style
            puts " "
            puts "Station: #{Station.all[input.to_i-1].station_name}"
            puts "-------------------------------------------------------------------------------"
            puts "Country: #{Station.all[input.to_i-1].country}"
            puts "-------------------------------------------------------------------------------"
            puts "Address: #{Station.all[input.to_i-1].address}"
            puts "-------------------------------------------------------------------------------"
            puts "City: #{Station.all[input.to_i-1].city }"
            puts "-------------------------------------------------------------------------------"
            puts "State: #{Station.all[input.to_i-1].state}"
            puts "-------------------------------------------------------------------------------"
            puts "Zipcode: #{Station.all[input.to_i-1].zipcode}"
            puts "-------------------------------------------------------------------------------"
            puts "PhoneNumber: #{Station.all[input.to_i-1].phonenumber}"
            puts "-------------------------------------------------------------------------------"
            puts "Station Information:"
            puts " "
            puts "#{Station.all[input.to_i-1].station_information}"
            puts " "
            puts " "
            puts "******************NEXT STATION********************"
            puts " "

          elsif input != "exit"
            puts " "
            puts "INVALID! please try again.".colorize(:color => :white, :background => :red)
            puts " "
        end
       end
      end

      def print_stations
         Station.all.each.with_index(1) do |station, index|
          puts "#{index}. #{station.name}"
        end
        puts " "
      end
    end


#    puts " "
#    pick_PoliceStation
#  end

#  def pick_PoliceStation
#    input = ""
#    while input != "exit" do

#      puts "Choose your Police Station."
#      puts "Enter a name or type 'exit' to exit."
#      puts " "
#    end
  end
end
