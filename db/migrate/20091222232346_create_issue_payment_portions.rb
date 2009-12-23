class CreateIssuePaymentPortions < ActiveRecord::Migration
  def self.up
    create_table :issue_payment_portions do |t|
      t.integer :issue_id, :apple_payment_id, :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :issue_payment_portions
  end
end
