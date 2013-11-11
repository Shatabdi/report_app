class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
