class Bio < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  attr_protected :user_id
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 64
  
  validates_presence_of :phone
  validates_length_of :phone, :maximum => 16
end
