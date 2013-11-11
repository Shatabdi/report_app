class ChangeColumnNameOfEventComments < ActiveRecord::Migration
  def up
  	rename_column :event_comments, :category_id, :event_id
  end

  def down
  end
end
