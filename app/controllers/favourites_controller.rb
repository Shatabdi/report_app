class FavouritesController < ApplicationController

	def create
		@event = Event.where(:id => params[:event_id]).first
		unless @event.user_favourites.create(:user_id => current_user.id)
			redirect_to root_path
		end
	end

end
