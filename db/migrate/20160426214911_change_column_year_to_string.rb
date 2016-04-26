class ChangeColumnYearToString < ActiveRecord::Migration
  def change
    change_column :camps, :year, :string
  end
end
