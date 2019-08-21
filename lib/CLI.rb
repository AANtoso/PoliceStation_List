class CLI

  def call
    puts "Welcome Citizens!"
    puts "Here is a list of Police Stations."
    puts " "
        puts "----------------------------------"
        PoliceStationScraper.scrape_station_list
        print_stations
        pick_your_station
        end

      def pick_your_station

        input = ""
        while input != "exit" do

          puts "Choose your station!"
          puts "Enter a number for more information, enter 's' to view an alphabetized list of the stations, or type 'exit' to exit."

          input = gets.strip.downcase
          policestation = PoliceStation.all[input.to_i-1]

            if (1..PoliceStation.all.count).include?(input.to_i)
              PoliceStationScraper.scrape_station_details(policestation) if !policestation.country
            puts " "
            puts "Country: #{policestation.country}"
            puts "Address: #{policestation.address}"
            puts "City: #{policestation.city}"
            puts "State: #{policestation.state}"
            puts "Zipcode: #{policestation.zipcode}"
            puts " "
            puts "******************NEXT STATION********************"
            puts " "
          elsif input.downcase == "s"
            alphabetically_sort
          elsif input != "exit"
            puts " "
            puts "INVALID! Please try again.".colorize(:color => :white, :background => :red)
            puts " "
        end
       end
      end

      def print_stations
         PoliceStation.all.each.with_index(1) do |station, index|
          puts "#{index}. #{station.name}"
        end
        puts " "
      end
    def alphabetically_sort
      abc_list = PoliceStation.all.sort {|a, b| a.name <=> b.name}
      abc_list.each.with_index(1) do |station, index|
        puts "#{index}. #{station.name}"
      end
    end
end
