class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.belongs_to :location, index: true
      t.string :website

      t.timestamps null: false
    end
  end
end
