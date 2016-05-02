class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :capacity
      t.belongs_to :program, index: true
      t.belongs_to :location, index: true
      t.integer :start_time_of_day
      t.integer :end_time_of_day
      t.integer :duration 
      t.integer :price
      t.text :prerequisite
      t.string :currency_code
      t.text :price_details

      t.timestamps null: false
    end
  end
end
