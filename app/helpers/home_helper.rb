module HomeHelper
  def flight_code(code, flight)
    "#{code}-#{flight}"
  end

  def flight_static_desc(raw_desc)
    KeyValues::FlightStatus.find_by_desc(raw_desc).zh
  end

  def flight_code_name(flight)
    flight_code = "#{flight.code}-#{flight.flight}"
    "#{flight.code_zh} #{flight_code}"
  end

  def time_status(time, status)
    short_time = l(time, format: :short)
    static_desc = flight_static_desc(status)

    "#{static_desc} #{short_time}"
  end
end
