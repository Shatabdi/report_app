class Event < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :user_id, 
  	:event_images_attributes, :address
  geocoded_by :address,
   :latitude => :lat, :longitude => :lan
  after_validation :geocode
  belongs_to :category
  belongs_to :user
  has_many :event_images
  has_many :event_comments
  has_many :event_approvals
  has_many :user_favourites
  accepts_nested_attributes_for :event_images
end
