require 'httparty'

class Transaction < ActiveRecord::Base
  # TODO: Remove apple validated, test a little, strip down to_xml in controller to not say a whole lot.
  
  belongs_to :issue
  belongs_to :original_transaction, :class_name => "Transaction", :foreign_key => "original_transaction_id"
  
  validates_presence_of :issue_id
  validates_presence_of :quantity
  validates_presence_of :identifier
  validates_presence_of :product_identifier
  # validates_presence_of :app_identifier
  # validates_presence_of :version_external_identifier
  validates_presence_of :purchased_at
  
  validate_on_create :valid_receipt
  
  def valid_receipt
    self.errors.add(:base, "receipt was not validated by iTunes") unless @valid_receipt
  end
  
  def receipt=(receipt)
    validator = Validator.new(receipt)
    if @valid_receipt = validator.valid?
      self.quantity = validator.response["receipt"]["quantity"]
      self.purchased_at = DateTime.parse validator.response["receipt"]["purchase_date"]
      self.identifier = validator.response["receipt"]["transaction_id"]
      self.product_identifier = validator.response["receipt"]["product_id"]
      self.issue = Issue.find_by_product_identifier validator.response["receipt"]["product_id"]
      if validator.response["receipt"]["transaction_id"] != validator.response["receipt"]["original_transaction_id"]
        self.original_transaction = Transaction.find_by_identifier validator.response["receipt"]["original_transaction_id"]
      end
    end
  end
  
  class Validator
    include HTTParty
    format :json
    attr_accessor :response

    def initialize(receipt)
      @response = self.class.post SETTINGS[:itunes_verification_url], :body => { "receipt-data" => receipt }.to_json
    end

    def valid?
      @response["status"] == 0
    end
  end
end
