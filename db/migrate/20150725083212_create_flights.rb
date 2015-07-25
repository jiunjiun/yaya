class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string      :terminal
      t.string      :kind
      t.string      :code
      t.string      :code_zh
      t.string      :flight
      t.string      :gate
      t.datetime    :datetime
      t.datetime    :expected_datetime
      t.references  :destination, index: true
      t.string      :flight_status
      t.string      :aircraft_type
      t.references  :other_route, index: true
      t.string      :baggage_carousel
      t.string      :check_in_counter

      t.timestamps null: false
    end
  end
end
