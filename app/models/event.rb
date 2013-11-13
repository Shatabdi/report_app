class Event < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :user_id, 
  	:event_images_attributes, :address
  validates :title, :presence => true, :length => { :maximum => 10 }
  validates :description, :presence => true, :length => { :maximum => 30 }
  validates :address, :presence => true,  :length => { :maximum => 20 }
  # validates :lat, :presence => {:message => "please enter a valid address"} 
  # validates :lan, :presence => {:message => "please enter a valid address"} 
  geocoded_by :address,
   :latitude => :lat, :longitude => :lan
  before_validation :geocode
  # has_many :preferred_users, :through => :user_favourites, :source => :user
  belongs_to :category
  belongs_to :user
  has_many :event_images
  has_many :event_comments
  has_many :event_approvals
  has_many :user_favourites
  accepts_nested_attributes_for :event_images
end
