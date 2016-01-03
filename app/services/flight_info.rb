#!/usr/bin/env ruby

require 'hasami'
class FlightInfo
  #  save yesterday flight info
  def self.save_yesterday_info
    haha = Hasami.new
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

  attr_accessor :hasami

  def initialize
    @hasami = Hasami.new
  end

  def flights
    @hasami.by_datetime.filter_kind
  end

  def today
    @hasami.today.filter_kind
  end

  def tomorrow
    @hasami.tomorrow.filter_kind
  end

  def flights_status
    status_count = {on_time: 0, departed: 0, delay: 0, schedule_change: 0, cancelled: 0, arrived: 0, sum: 0}
    flights = @hasami.today

    status_count[:sum] = flights.size
    flights.each do |flight|
      status_count[KeyValues::FlightStatus.find_by_desc(flight.flight_status).code.to_sym] += 1
    end

    status_count
  end

  def flights_country
    flights_country = {}
    flight_arrivals_iata_count  = {}
    flight_arrivals_country_count = {}
    flight_departure_iata_count = {}
    flight_departure_country_count = {}

    flights = @hasami.today.filter_kind

    flight_arr = flights[:Arrivals]
    flight_arr.each do |flight|
      iata = flight.destination.iata

      if flight_arrivals_iata_count[iata].blank?
        flight_arrivals_iata_count[iata] = 1
      else
        flight_arrivals_iata_count[iata] += 1
      end
    end

    country_codes = Hash[ Iatum.where.not(code: nil).pluck(:code, :country_code)]

    flight_arrivals_iata_count.each do |key, val|
      if flight_arrivals_country_count[country_codes[key]].blank?
        flight_arrivals_country_count[country_codes[key]] = val
      else
        flight_arrivals_country_count[country_codes[key]] += val
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
      if flight_departure_country_count[country_codes[key]].blank?
        flight_departure_country_count[country_codes[key]] = val
      else
        flight_departure_country_count[country_codes[key]] += val
      end
    end

    flight_arrivals_country_count = Hash[flight_arrivals_country_count.sort_by{|k,v| v}.reverse]
    flight_departure_country_count = Hash[flight_departure_country_count.sort_by{|k,v| v}.reverse]

    flights_countrys = {arrivals: flight_arrivals_country_count, departure: flight_departure_country_count}
  end

  def flights_filter_by_today
    result = {arrivals: {}, departure: {}}

    23.times { |t| result[:arrivals][t] = result[:departure][t] = 0  }

    flights = self.today
    flights[:Arrivals].each do |flight|
      hour = flight[:expected_datetime].to_time.hour

      result[:arrivals][hour] = 0 if result[:arrivals][hour].blank?
      result[:arrivals][hour] += 1
    end

    flights[:Departure].each do |flight|
      hour = flight[:expected_datetime].to_time.hour

      result[:departure][hour] = 0 if result[:departure][hour].blank?
      result[:departure][hour] += 1
    end

    result
  end

end
