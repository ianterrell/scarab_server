class Interview < ActiveRecord::Base
  belongs_to :author
  has_many :footnotes
  
  validates_presence_of :number, :body, :author_id
  
  is_a_published_model
end
