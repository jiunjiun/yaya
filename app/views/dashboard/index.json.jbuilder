json.success true
json.flights_country do
  json.arrivals @flights_country[:arrivals].each do |k, v|
    json.name t(k, scope: :countries)
    json.y v
  end
  json.departure @flights_country[:departure].each do |k, v|
    json.name t(k, scope: :countries)
    json.y v
  end
end

json.flights_filter_by_today do
  json.arrivals @flights_filter_by_today[:arrivals].values
  json.departure @flights_filter_by_today[:departure].values
end
