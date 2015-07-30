#!/usr/bin/env ruby

require 'alohaha'
require 'alohaha/flight_helper'
class FlightInfo
  #  save yesterday flight info
  def self.save_yesterday_info
    haha = Alohaha.new
    haha.flights.each do |flight|
      if flight.datetime > Date.yesterday && flight.datetime < Date.today
        destination = Destination.find_or_create(flight.destination)
        other_route = Destination.find_or_create(flight.other_route)

        fs = flight.flight_status
        flight_filter = flight.to_hash.reject {|key, value| key == :raw || key == :destination || key == :other_route || key == :flight_status}

        flight_info             = Flight.new(flight_filter)
        flight_info.destination = destination
        flight_info.other_route = other_route
        flight_info.kind        = KeyValues::FlightKind.find_by_name(flight.kind).code
        flight_info.status      = KeyValues::FlightStatus.find_by_desc(fs).id
        flight_info.save
      end
    end
  end

  def self.flights
    Alohaha.new.by_datetime.filter_kind
  end

  def self.today
    Alohaha.new.today.filter_kind
  end

  def self.tomorrow
    Alohaha.new.tomorrow.filter_kind
  end
end
