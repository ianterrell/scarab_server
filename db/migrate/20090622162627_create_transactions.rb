class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :issue_id, :original_transaction_id, :quantity
      t.string :identifier, :product_identifier, :app_identifier, :version_external_identifier
      t.boolean :apple_validated
      t.datetime :purchased_at
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
