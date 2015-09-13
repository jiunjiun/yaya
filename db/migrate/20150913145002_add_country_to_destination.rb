class AddCountryToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :airport, :string

    add_column :destinations, :country, :string
    add_column :destinations, :country_code, :string

    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
  end
end
