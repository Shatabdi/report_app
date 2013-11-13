class EventComment < ActiveRecord::Base
  attr_accessible :category_id, :comment, :user_id, :event_id
  validates :comment, :presence => true
  belongs_to :event
end
