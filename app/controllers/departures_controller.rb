class DeparturesController < ApplicationController
  def today
    flights = FlightInfo.today
    @flight_today_t1 = flights[:Departure].select {|flight| flight.terminal == 'T1'}
    @flight_today_t2 = flights[:Departure].select {|flight| flight.terminal == 'T2'}
  end

  def tomorrow
    flights = FlightInfo.tomorrow
    @flight_today_t1 = flights[:Departure].select {|flight| flight.terminal == 'T1'}
    @flight_today_t2 = flights[:Departure].select {|flight| flight.terminal == 'T2'}
  end
end
