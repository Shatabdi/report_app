class CreateTwitterAccessTokens < ActiveRecord::Migration
  def change
    create_table :twitter_access_tokens do |t|
    	t.integer :user_id
    	t.string :access_token
    	t.string :uid
    	t.string :secret

      t.timestamps
    end
  end
end
