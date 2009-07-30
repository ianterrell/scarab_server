class Work < ActiveRecord::Base
  belongs_to :issue
  belongs_to :author
  belongs_to :submission
  
  validates_presence_of :title, :body, :author_id, :issue_id
end
