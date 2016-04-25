class RenameColumn < ActiveRecord::Migration
  def change
    change_table :camps do |t|
      t.rename :privider, :provider
      t.rename :end_time, :end_date
    end
  end
end
