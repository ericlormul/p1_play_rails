class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :detail
      t.integer :program_id
      t.integer :person_id
      t.datetime :confirmed_at
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :reviews, :program_id
    add_index :reviews, :person_id
  end
end
