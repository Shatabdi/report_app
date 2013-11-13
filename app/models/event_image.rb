class EventImage < ActiveRecord::Base
  attr_accessible :event_id, :image
  belongs_to :event
  has_attached_file :image
  validates :image, :presence => true
  validates_attachment_size :image, :less_than => 2.megabytes, :message => " File size must be less than 2MB.", :allow_blank => true
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/png','image/jpg', "image/pjpeg","image/x-png" ],
                                    :message => " Please upload only jpeg, jpg, png images.", :allow_blank => true
end
