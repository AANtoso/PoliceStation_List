class CLI

  def call
    puts "Welcome Citizens!"
    puts "Here is a list of Police Stations."
    puts " "
        puts "----------------------------------"
        PoliceStationScraper.scrape_station_list
        print_stations
        input = ""
        while input != "exit" do
        puts "Choose your station!"
        puts "Enter a number for more information or type 'exit' to exit."
        puts " "
        input = gets.strip.downcase
        binding.pry
        PoliceStationScraper.scrape_station_details(PoliceStation.all[input.to_i-1]) if !PoliceStation.all[input.to_i-1].style
        # pick_your_station
        # PoliceStation.find_all_by_name("")
      end
    end


      # def pick_your_station

      #   input = ""
      #   while input != "exit" do
      #
      #     puts "Choose your station!"
      #     puts "Enter a number for more information or type 'exit' to exit."
      #
      #     input = gets.strip.downcase
      #
      #     if (1..PoliceStation.all.count).include?(input.to_i)
      #       PoliceStationScraper.scrape_station_details(PoliceStation.all[input.to_i-1]) if !PoliceStation.all[input.to_i-1].style
      #       puts " "
      #       puts "Station: #{PoliceStation.all[input.to_i-1].station_name}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "Country: #{PoliceStation.all[input.to_i-1].country}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "Address: #{PoliceStation.all[input.to_i-1].address}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "City: #{PoliceStation.all[input.to_i-1].city }"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "State: #{PoliceStation.all[input.to_i-1].state}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "Zipcode: #{PoliceStation.all[input.to_i-1].zipcode}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "PhoneNumber: #{PoliceStation.all[input.to_i-1].phonenumber}"
      #       puts "-------------------------------------------------------------------------------"
      #       puts "Station Information:"
      #       puts " "
      #       puts "#{PoliceStation.all[input.to_i-1].station_information}"
      #       puts " "
      #       puts "******************NEXT STATION********************"
      #       puts " "
      #
      #     elsif input != "exit"
      #       puts " "
      #       puts "INVALID! please try again.".colorize(:color => :white, :background => :red)
      #       puts " "
      #   end
      #  end
      # end

      def print_stations
         PoliceStation.all.each.with_index(1) do |station, index|
          puts "#{index}. #{station.name}"
        end
        puts " "
      end
end
