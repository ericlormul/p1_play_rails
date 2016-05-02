class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :location_id
      t.string :website

      t.timestamps null: false
    end
    add_index :providers, :location_id
  end
end
