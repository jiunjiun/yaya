class DashboardController < ApplicationController
  def index
    fi                       = FlightInfo.new
    @flights_status          = fi.flights_status
    @flights_country         = fi.flights_country
    @flights_filter_by_today = fi.flights_filter_by_today

    respond_to do |format|
      format.html {}
      format.json {}
    end
  end
end
