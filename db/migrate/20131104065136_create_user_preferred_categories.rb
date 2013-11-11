class CreateUserPreferredCategories < ActiveRecord::Migration
  def change
    create_table :user_preferred_categories do |t|
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
