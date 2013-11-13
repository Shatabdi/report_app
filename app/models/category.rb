class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true, :length => { :maximum => 10 }
 	has_many :events, :dependent => :destroy
  has_many :user_preferred_categories
end
