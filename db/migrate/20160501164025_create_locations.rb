class CreateLocations < ActiveRecord::Migration
  def change
    drop_table 'camps' if ActiveRecord::Base.connection.table_exists? 'camps'

	create_table :locations do |t|

      t.timestamps null: false
    end
  end
end
