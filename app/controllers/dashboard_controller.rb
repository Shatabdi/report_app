class DashboardController < ApplicationController

	def index

		@counter = params['counter'].to_i || 0
		preferred_categories = current_user.user_preferred_categories
		@events =  preferred_categories.blank? ? Event.includes(:event_images, :user).order(id: :desc).limit(10).offset(@counter*10) : current_user.preferred_events.includes(:event_images, :user).order('id desc').limit(10).offset(@counter*10) 
		@total_events = (preferred_categories.blank? ? Event.count : current_user.preferred_events.count) if @counter == 0
		@counter += 1
	
	end

	def show
		@categories = Category.all
		@preferred_categories = current_user.preferred_categories
	end

	def create
		#render :text => params.inspect
		ActiveRecord::Base.connection.execute("DELETE FROM `user_preferred_categories` WHERE `user_id` = #{current_user.id}")
		unless 	params['user_preferred_category'].blank?
			params['user_preferred_category'].each do |upf|
				current_user.user_preferred_categories.create({:category_id => upf.to_i})
			end	
		end
	end
		
end

