class Category < ActiveRecord::Base
  default_scope :order => :position
  has_many :questions, :dependent => :destroy
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 64
end
