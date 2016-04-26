class AddTsvToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :tsv, :tsvector     
  end
end
