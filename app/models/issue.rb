class Issue < ActiveRecord::Base
  has_many :works, :order => :position
  has_many :authors, :through => :works
  
  validates_presence_of :number
  validates_uniqueness_of :number
  
  validates_presence_of :title
  validates_length_of :title, :maximum => 32
  
  validates_presence_of :subtitle
  validates_length_of :subtitle, :maximum => 128
  
  validates_presence_of :color
  validates_length_of :color, :within => 6..6
  
  is_a_published_model
end
