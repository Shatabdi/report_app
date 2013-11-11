class TwitterAccessToken < ActiveRecord::Base
   attr_accessible  :user_id, :access_token, :uid, :secret
   belongs_to :user
end
