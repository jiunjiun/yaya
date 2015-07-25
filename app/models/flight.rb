class Flight < ActiveRecord::Base
  belongs_to :destination, class_name: :Destination
  belongs_to :other_route, class_name: :Destination

  validates_presence_of :terminal, :kind, :code, :code_zh,
                        :flight, :gate, :datetime, :expected_datetime,
                        :destination_id, :flight_status

  validates_length_of :terminal, is: 2
  validates_length_of :code, is: 2
  validates_length_of :flight, maximum: 4
  validates_length_of :gate, maximum: 3
  validates_length_of :aircraft_type, maximum: 8

  validates_inclusion_of :terminal, :in => ["T1", "T2"]
  validates_inclusion_of :kind, :in => ["Arrivals", "Departure"]
end
