class Quarter < ActiveRecord::Base
  has_many :apple_payments do
    def total
      self.inject(0) { |x,y| x + y.amount }
    end
  end
  
  has_many :royalty_payments do
    def total
      self.inject(0) { |x,y| x + y.amount }
    end
  end
  
  validates_presence_of :name
  validates_length_of :name, :within => 3..32
end
