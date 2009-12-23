class ApplePayment < ActiveRecord::Base
  belongs_to :quarter
  has_many :issue_payment_portions
  
  validates_presence_of :code, :region, :amount, :quarter_id
  validates_length_of :code, :within => 3..8
  validates_length_of :region, :within => 3..32
end
