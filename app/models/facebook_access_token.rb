class FacebookAccessToken < ActiveRecord::Base
  attr_accessible :access_token, :uid, :user_id
  belongs_to :user
end
