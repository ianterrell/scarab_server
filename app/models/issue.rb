class Issue < ActiveRecord::Base
  has_many :works
  
  validates_presence_of :number
  validates_uniqueness_of :number
  
  validates_presence_of :title
  validates_length_of :title, :maximum => 32
  
  validates_presence_of :subtitle
  validates_length_of :subtitle, :maximum => 128
  
  validates_presence_of :color
  validates_length_of :color, :within => 6..6
  
  default_scope :order => :number
  named_scope :published, lambda { { :conditions => ["published_at <= ?", Time.now] } }
  named_scope :since_number, lambda { |number| { :conditions => ["number > ?", number] } }
  
  def published?
    published_at && published_at <= Time.now
  end
end
