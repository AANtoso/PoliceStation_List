class PoliceStation

 attr_accessor :name, :url, :station_name, :country, :address, :city, :state, :zipcode

@@all = []

 def initialize
   @@all << self
 end

 def self.all
   @@all
 end
end
