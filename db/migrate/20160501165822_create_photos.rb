class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :program, index: true
      t.string :url
      t.string :caption
      t.string :title

      t.timestamps null: false
    end
  end
end
