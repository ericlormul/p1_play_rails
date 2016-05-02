class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :detail
      t.belongs_to :program, index: true
      t.belongs_to :person, index: true
      t.datetime :confirmed_at
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
