class EventsController < ApplicationController

	def new
		@categories = Category.all
		@event = current_user.events.new
		@event.event_images.build
	end

	def create
		@event = current_user.events.new(params[:event])
		if @event.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def show
		@event = Event.where(:id => params[:id]).first
		@near_users = User.near([@event.lat, @event.lan], 10, :select => "users.id")
	end

end
