class ChartsController < ApplicationController
  def index
  end

  def ArrDep
    result = {}

    date = params[:date]
    # date = Date.parse('2015/08/02') rescue nil
    date = Date.parse(date) rescue nil
    if date
      arrivals = Flight.where("expected_datetime >= ? and expected_datetime < ?", date.beginning_of_day, (date+1).beginning_of_day ).where(kind: 'A')

      arrivals_t1 = arrivals.where(terminal: 'T1')
      arrivals_t2 = arrivals.where(terminal: 'T2')

      departure = Flight.where("datetime >= ? and datetime < ?", date.beginning_of_day, (date+1).beginning_of_day ).where(kind: 'A').where(kind: 'D')

      departure_t1 = departure.where(terminal: 'T1')
      departure_t2 = departure.where(terminal: 'T2')


      arrdeps = ChartTools.time_line(departure_t1)

      result = {
        arrivals: ChartTools.time_line(arrivals).values,
        arrivals_t1: ChartTools.time_line(arrivals_t1).values,
        arrivals_t2: ChartTools.time_line(arrivals_t2).values,
        departure: ChartTools.time_line(departure).values,
        departure_t1: ChartTools.time_line(departure_t1).values,
        departure_t2: ChartTools.time_line(departure_t2).values,
      }
    end
    respond_to do |format|
      format.json { render json: result}
    end
  end
end
