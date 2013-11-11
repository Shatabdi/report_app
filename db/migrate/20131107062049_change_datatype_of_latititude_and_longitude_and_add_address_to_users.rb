class ChangeDatatypeOfLatititudeAndLongitudeAndAddAddressToUsers < ActiveRecord::Migration
  def up
  	change_column :users, :latitude, :float
  	change_column :users, :longitude, :float
  end

  def down
  end
end
