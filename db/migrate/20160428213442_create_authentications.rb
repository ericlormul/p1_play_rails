class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :person_id
      t.string :auth_token
      t.datetime :deleted_at
      
      t.timestamps null: false
    end
  end
end
