module HomeHelper
  def flight_code(code, flight)
    "#{code}-#{flight}"
  end

  def flight_static(raw_desc)
    KeyValues::FlightStatus.find_by_desc(raw_desc)
  end

  def flight_code_name(flight)
    flight_code = "#{flight.code}-#{flight.flight}"
    "#{flight.code_zh} #{flight_code}"
  end

  def time_status(time, status)
    short_time = l(time, format: :short)

    fs = flight_static(status)
    fs_class = 'label '
    case fs.id
    when 1
      fs_class += 'label-success'
    when 2
      fs_class += 'label-info'
    when 3..4
      fs_class += 'label-warning'
    when 5..6
      fs_class += 'label-danger'
    end
    time_status_desc = content_tag(:sapn, "#{fs.zh} #{short_time}", class: fs_class.to_sym)
    raw time_status_desc
  end
end
