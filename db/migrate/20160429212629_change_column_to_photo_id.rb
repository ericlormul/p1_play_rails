class ChangeColumnToPhotoId < ActiveRecord::Migration
  def change
    rename_column :programs, :phote_id, :photo_id
  end
end
