class AddLatAndLanToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lat, :float
    add_column :events, :lan, :float
  end
end
