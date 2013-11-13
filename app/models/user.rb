class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password
  attr_accessible :name, :email, :lat, :lon, :ip_address, :password, :password_confirmation, :remember_me, :twitter_access_token_attributes
  validates :email, :presence => true,  :uniqueness => {:case_sensitive => false}
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
 
  geocoded_by :ip_address,
  :latitude => :lat, :longitude => :lon
  before_save :geocode
  has_one :facebook_access_token
  has_one :twitter_access_token
  has_many :events
  has_many :event_approvals
  has_many :approved_events, :through => :event_approvals, :source => :event
  has_many :user_favourites
  has_many :favourite_events, :through => :user_favourites, :source => :event
  has_many :user_preferred_categories
  has_many :preferred_categories, :through => :user_preferred_categories, :source => :category
  has_many :preferred_events, :through => :preferred_categories, :source => :events
  accepts_nested_attributes_for :twitter_access_token, allow_destroy: true
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
  after_save :lat_and_lan

  def lat_and_lan
   if self.lat == 0.000000 && self.lon == 0.000000
      self.ip_address = Rails.application.config.default_ip_address
      self.save(:validate => false)
    end
  end


end
