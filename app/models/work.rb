class Work < ActiveRecord::Base
  belongs_to :issue
  belongs_to :author
  belongs_to :submission
  
  acts_as_list :scope => :issue_id
  
  has_attached_file :audio, 
    :url           => "/protected/:attachment/:id/:style/:basename.:extension",
    :path          => ":rails_root/protected/:attachment/:id/:style/:basename.:extension"
  validates_attachment_presence :audio
  
  validates_presence_of :title, :body, :author_id, :issue_id, :reader
  
  customize_xml_and_json :except => [:submission_id, :created_at, :updated_at, :issue_id]
end
