class Destination < ActiveRecord::Base
  validates_presence_of :iata, :en, :zh
  validates_length_of :iata, is: 3

  def self.find_or_create(destination = {})
    create_with(en: destination.en, zh: destination.zh).find_or_create_by(iata: destination.iata) if destination.iata.present?
  end
end
