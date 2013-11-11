class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  def facebook 

		auth = request.env["omniauth.auth"]
		@ip_address= request.ip
		unless auth.credentials.token.blank? 

		 	@user = User.where(:email => auth.info.email).first
		 	if @user.blank?

			 	 @new_user = User.create(:email => auth.info.email,       
			 	    :password => Devise.friendly_token[0,20],
			 	  	:name => auth.extra.raw_info.name, :ip_address => @ip_address)
			 	 @new_user.create_facebook_access_token(:uid => auth.uid,
			 	  :access_token => auth.credentials.token)
			 	 sign_in @new_user, :event => :authentication
			else

				@user.facebook_access_token.update_attributes(:access_token => auth.credentials.token)
			 	sign_in @user, :event => :authentication

			end

		else

		 		flash[:alert] = 'You need to permit the app to access your facebook credential'

		end
		redirect_to root_path

	end

	def twitter

		auth = request.env["omniauth.auth"]
		unless auth.credentials.token.blank? 

			@check_uid = TwitterAccessToken.where(:uid => auth.uid).first
	  	if @check_uid.blank?

		 		@name = auth.extra.raw_info.name 
	  		@access_token = auth.credentials.token
	  		@secret = auth.credentials.secret
	  		@ip_address= request.ip
	  		@uid =  auth.uid
				@user = User.new
		 		@user.build_twitter_access_token
		 	
	  	else

			 	@user.twitter_access_token.update_attributes(:access_token => auth.credentials.token, :secret => auth.credentials.secret)
			 	sign_in @user, :event => :authentication

	 		end

		end

	end

	def passthru
    render :status => 404, :text => "Not found. Authentication passthru."
  end

  def failure
    set_flash_message :alert, :failure, :kind => OmniAuth::Utils.camelize(failed_strategy.name), :reason => failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  protected

  def failed_strategy
    env["omniauth.error.strategy"]
  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end

  def after_omniauth_failure_path_for(scope)
    new_session_path(scope)
  end
end
