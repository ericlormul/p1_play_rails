class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.belongs_to :program, index: true

      t.timestamps null: false
    end
  end
end
