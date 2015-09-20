class CreateIata < ActiveRecord::Migration
  def change
    create_table :iata do |t|
      t.string :code
      t.string :en
      t.string :zh
      t.string :airport
      t.string :country
      t.string :country_code

      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
