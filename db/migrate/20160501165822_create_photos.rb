class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :program_id
      t.string :url
      t.string :caption
      t.string :title

      t.timestamps null: false
    end
    add_index :photos, :program_id
  end
end
