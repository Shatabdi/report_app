class EventComment < ActiveRecord::Base
  attr_accessible :category_id, :comment, :user_id, :event_id
  belongs_to :event
end
