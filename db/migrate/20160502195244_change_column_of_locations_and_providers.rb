class ChangeColumnOfLocationsAndProviders < ActiveRecord::Migration
  def change
    add_column :locations, :provider_id, :integer
    add_column :locations, :session_id, :integer
  end
end
