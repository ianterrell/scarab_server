class Author < ActiveRecord::Base
  has_many :works
  has_many :issues, :through => :works
  belongs_to :user
  
  has_attached_file :photo, :styles => { :large => "128x128>", :medium => "64x64>", :thumb => "32x32>" }
  
  validates_presence_of :name, :location, :bio
  
  customize_xml_and_json :methods => :photo_url, :except => [:photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :created_at]
  
  def photo_url
    self.photo.url(:medium)
  end
end
