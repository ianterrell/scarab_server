class CreateApplePayments < ActiveRecord::Migration
  def self.up
    create_table :apple_payments do |t|
      t.integer :quarter_id
      t.string :code, :limit => 8
      t.string :region, :limit => 32
      t.integer :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :apple_payments
  end
end
