class Transaction < ActiveRecord::Base
  belongs_to :issue
  belongs_to :original_transaction, :class_name => "Transaction", :foreign_key => "original_transaction_id"
  
  validates_presence_of :issue_id
  validates_presence_of :quantity
  validates_presence_of :identifier
  validates_presence_of :product_identifier
  validates_presence_of :app_identifier
  validates_presence_of :version_external_identifier
  validates_presence_of :purchased_at
  
end
