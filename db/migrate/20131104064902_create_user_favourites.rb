class CreateUserFavourites < ActiveRecord::Migration
  def change
    create_table :user_favourites do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
