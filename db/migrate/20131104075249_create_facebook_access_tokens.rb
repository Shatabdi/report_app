class CreateFacebookAccessTokens < ActiveRecord::Migration
  def change
    create_table :facebook_access_tokens do |t|
      t.integer :user_id
      t.integer :uid
      t.integer :access_token

      t.timestamps
    end
  end
end
