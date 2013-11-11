class RenameAddressInUsers < ActiveRecord::Migration
  def up
  	rename_column :users, :address, :ip_address
  end

  def down
  end
end
