class ChangeDatatypeOfLatAndLon < ActiveRecord::Migration
  def up
  	rename_column :users, :latitude, :lat
  	rename_column :users, :longitude, :lon
  	change_column :users, :lat, :decimal, {:precision=>10, :scale=>6}
  	change_column :users, :lon, :decimal, {:precision=>10, :scale=>6}
  	
  end

  def down
  end
end
