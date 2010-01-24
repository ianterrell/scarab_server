class CreateRoyaltyPayments < ActiveRecord::Migration
  def self.up
    create_table :royalty_payments do |t|
      t.integer :author_id, :quarter_id
      t.integer :amount, :default => 0
      t.datetime :paid_at
      t.timestamps
    end
  end

  def self.down
    drop_table :royalty_payments
  end
end
