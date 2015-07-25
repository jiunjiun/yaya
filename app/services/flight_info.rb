#!/usr/bin/env ruby

class FlightInfo
  def self.save_yesterday_info
    haha = Alohaha.new
    haha.flights.each do |flight|
      if flight.datetime > Date.yesterday && flight.datetime < Date.today
        destination = Destination.find_or_create(flight.destination)
        other_route = Destination.find_or_create(flight.other_route)

        flight_filter = flight.to_hash.reject {|key, value| key == :raw || key == :destination || key == :other_route}
        flight_info = Flight.new(flight_filter)
        flight_info.destination = destination
        flight_info.other_route = other_route
        flight_info.save
      end
    end
  end
end
