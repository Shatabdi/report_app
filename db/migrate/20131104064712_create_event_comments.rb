class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.integer :category_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
