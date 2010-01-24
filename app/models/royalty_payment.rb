class RoyaltyPayment < ActiveRecord::Base
  AUTHOR_ROYALTY_PORTION = 0.028476
  
  belongs_to :quarter
  belongs_to :author
  validates_presence_of :quarter_id, :author_id, :amount
  
  def paid?
    !!paid_at
  end
end
