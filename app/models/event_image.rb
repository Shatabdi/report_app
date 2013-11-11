class EventImage < ActiveRecord::Base
  attr_accessible :event_id, :image
  belongs_to :event
  has_attached_file :image
  validates :image, :presence => true
end
