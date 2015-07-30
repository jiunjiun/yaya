module HomeHelper
  def flight_static_desc(raw_desc)
    KeyValues::FlightStatus.find_by_desc(raw_desc).zh
  end
end
