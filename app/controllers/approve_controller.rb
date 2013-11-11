class ApproveController < ApplicationController

	def create
		@event = Event.where(:id => params[:event_id]).first
		@approve = @event.event_approvals.create(:user_id => current_user.id)
	end

end
