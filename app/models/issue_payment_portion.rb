class IssuePaymentPortion < ActiveRecord::Base
  belongs_to :issue
  belongs_to :apple_payment
  
  validates_presence_of :issue_id, :apple_payment_id, :amount
end
