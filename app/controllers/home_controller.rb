class HomeController < ApplicationController
  def index
    flights = FlightInfo.flights
    @flight_arrivals = flights[:Arrivals].take(20)
    @flight_departure = flights[:Departure].take(20)
  end
end
