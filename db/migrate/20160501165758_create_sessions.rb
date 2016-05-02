class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :capacity
      t.integer :program_id
      t.integer :location_id
      t.integer :start_time_of_day
      t.integer :end_time_of_day
      t.integer :duration 
      t.integer :price
      t.text :prerequisite
      t.string :currency_code
      t.text :price_details

      t.timestamps null: false
    end
    add_index :sessions, :program_id
    add_index :sessions, :location_id
  end
end
