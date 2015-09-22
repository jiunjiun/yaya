class DashboardController < ApplicationController
  def index
    @flights_status = FlightInfo.flights_status
    @flights_country = FlightInfo.flights_country

    # render text: flights_country.to_json
  end
end
