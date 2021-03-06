class Author < ActiveRecord::Base
  has_many :works
  has_many :issues, :through => :works
  belongs_to :user
  has_many :royalty_payments do
    def total
      self.inject(0) { |x,y| x + y.amount }
    end
  end
  
  has_attached_file :photo, :styles => { :large => "128x128>", :medium => "64x64>", :web => "52x52>", :thumb => "32x32>" }
  
  validates_presence_of :name, :location, :bio
  
  customize_xml_and_json :methods => :photo_url, 
    :except => [:user_id, :created_at, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at]
  
  def photo_url
    self.photo.url(:medium)
  end
  
  def web_biography
    self.web_bio.blank? ? self.bio.gsub("\n","<br/>") : self.web_bio.gsub("\n","<br/>")
  end
end
