class CommentsController < ApplicationController

	def new
		@comment = EventComment.new
		@event = Event.where(:id => params[:event_id]).first
	end

	def create
		@event = Event.where(:id => params[:event_id]).first
		@comment = @event.event_comments.new(params[:event_comment].merge(:user_id => current_user.id))
		if @comment.save
			redirect_to root_path
		else
			render 'new'
		end
	end

end
