class Iatum < ActiveRecord::Base
  validates_presence_of :code, :en, :zh
  validates_length_of :code, is: 3

  before_create :find_destination_info

  def self.find_or_create(destination = {})
    create_with(en: destination.en, zh: destination.zh).find_or_create_by(code: destination.iata) if destination.iata.present?
  end

  def find_destination_info
    geoinfo = Geocoder.find_geo(self.code)

    self.airport      = geoinfo[:airport]
    self.country      = geoinfo[:country]
    self.country_code = geoinfo[:country_code]
    self.latitude     = geoinfo[:latitude]
    self.longitude    = geoinfo[:longitude]
  end

  def update_country
    geoinfo = Geocoder.find_geo(self.code)
    geoinfo = Geocoder.find_geo(self.en) if geoinfo.blank?

    self.airport      = geoinfo[:airport]
    self.country      = geoinfo[:country]
    self.country_code = geoinfo[:country_code]
    self.latitude     = geoinfo[:latitude]
    self.longitude    = geoinfo[:longitude]

    self.save if self.changed?
  end
end
