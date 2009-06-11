class Question < ActiveRecord::Base
  default_scope :order => :position
  
  belongs_to :category
  
  validates_presence_of :body
  validates_length_of :body, :maximum => 255
  
  validates_presence_of :answer
  
  validates_presence_of :category_id
end
