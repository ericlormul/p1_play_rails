class CreateLocations < ActiveRecord::Migration
  def change
    drop_table 'camps' if ActiveRecord::Base.connection.table_exists? 'camps'

	create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
