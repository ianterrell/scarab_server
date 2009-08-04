class Update < ActiveRecord::Base
  validates_presence_of :body, :number
  
  is_a_published_model
end
