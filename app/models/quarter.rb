class Quarter < ActiveRecord::Base
  has_many :apple_payments
  
  validates_presence_of :name
  validates_length_of :name, :within => 3..32
end
