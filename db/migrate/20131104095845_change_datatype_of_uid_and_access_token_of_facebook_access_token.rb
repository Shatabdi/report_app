class ChangeDatatypeOfUidAndAccessTokenOfFacebookAccessToken < ActiveRecord::Migration

	def up
		change_column :facebook_access_tokens, :uid, :string
		change_column :facebook_access_tokens, :access_token, :string
	end

end
