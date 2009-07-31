class Work < ActiveRecord::Base
  belongs_to :issue
  belongs_to :author
  belongs_to :submission
  
  acts_as_list :scope => :issue_id
  
  validates_presence_of :title, :body, :author_id, :issue_id, :reader
  
  customize_xml_and_json :except => [:submission_id, :created_at, :updated_at, :issue_id]
end
