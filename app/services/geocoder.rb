class Geocoder
  # https://developers.google.com/maps/documentation/geocoding/intro?hl=zh-tw
  # http://blog.darkthread.net/post-2012-06-15-geocoding-api.aspx
  # https://maps.googleapis.com/maps/api/geocode/json?address=KHH%20airport

  GoogleGeocodeUrl = 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyDRk7n-OLHkQ67yVLsoybXvLWziOWWh9kE&address='

  def self.find_geo(address)
    geo_info = {}
    url = "#{GoogleGeocodeUrl}#{address} airport"
    results = JSON.parse(open(url).read)
    status  = results['status']
    results = results['results'].first

    if status == 'OK'
      results['address_components'].reverse.each do |address|
        if address['types'].include? 'country'
          geo_info[:country]      = address['long_name']
          geo_info[:country_code] = address['short_name']
        end

        if address['types'].include? 'establishment'
          geo_info[:airport]      = address['long_name']
        end
      end

      geo_info[:latitude] = results['geometry']['location']['lat']
      geo_info[:longitude] = results['geometry']['location']['lng']
    end

    geo_info
  end
end
