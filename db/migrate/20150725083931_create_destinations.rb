class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :iata
      t.string :en
      t.string :zh

      t.timestamps null: false
    end
  end
end
