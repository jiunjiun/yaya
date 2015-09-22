#!/usr/bin/env ruby

require 'alohaha'
require 'alohaha/flight_helper'
class FlightInfo
  #  save yesterday flight info
  def self.save_yesterday_info
    haha = Alohaha.new
    haha.flights.each do |flight|
      if flight.datetime >= Date.yesterday.beginning_of_day && flight.datetime < Date.today.beginning_of_day
        destination = Iatum.find_or_create(flight.destination)
        other_route = Iatum.find_or_create(flight.other_route)

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

  def self.flights_status
    status_count = {on_time: 0, departed: 0, delay: 0, schedule_change: 0, cancelled: 0, arrived: 0}
    flights = Alohaha.new.today

    flights.each do |flight|
      status_count[KeyValues::FlightStatus.find_by_desc(flight.flight_status).code.to_sym] += 1
    end

    status_count
  end

  def self.flights_country
    flights_country = {}
    flight_arrivals_iata_count  = {}
    flight_arrivals_country_count = {}
    flight_departure_iata_count = {}
    flight_departure_country_count = {}

    flights = Alohaha.new.today.filter_kind

    flight_arr = flights[:Arrivals]
    flight_arr.each do |flight|
      iata = flight.destination.iata

      if flight_arrivals_iata_count[iata].blank?
        flight_arrivals_iata_count[iata] = 1
      else
        flight_arrivals_iata_count[iata] += 1
      end
    end

    flight_arrivals_iata_count.each do |key, val|
      iatum = Iatum.find_by_code(key)
      next if iatum.blank?
      if flight_arrivals_country_count[iatum.country_code].blank?
        flight_arrivals_country_count[iatum.country_code] = val
      else
        flight_arrivals_country_count[iatum.country_code] += val
      end
    end

    flight_dep = flights[:Departure]
    flight_dep.each do |flight|
      iata = flight.destination.iata

      if flight_departure_iata_count[iata].blank?
        flight_departure_iata_count[iata] = 1
      else
        flight_departure_iata_count[iata] += 1
      end
    end

    flight_departure_iata_count.each do |key, val|
      iatum = Iatum.find_by_code(key)
      next if iatum.blank?
      if flight_departure_country_count[iatum.country_code].blank?
        flight_departure_country_count[iatum.country_code] = val
      else
        flight_departure_country_count[iatum.country_code] += val
      end
    end

    flight_arrivals_country_count = Hash[flight_arrivals_country_count.sort_by{|k,v| v}.reverse]
    flight_departure_country_count = Hash[flight_departure_country_count.sort_by{|k,v| v}.reverse]

    flights_countrys = {arrivals: flight_arrivals_country_count, departure: flight_departure_country_count}
  end


end
