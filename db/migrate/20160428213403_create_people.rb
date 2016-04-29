class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :nickname
      t.date :birthday
      t.integer :location_id
      t.string :role
      t.datetime :deleted_at
      
      t.timestamps null: false
    end
  end
end
