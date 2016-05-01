class AddSummaryToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :summary, :text
  end
end
