class Notify < ActionMailer::Base

	default from: "from@example.com"

	def send_token(user_email, user_token)
		@token = user_token
		@s = view_context.link_to 'click_here', password_change_password_reset_url(@token)
		mail(:to => user_email, :subject => 'change password')
	end

end