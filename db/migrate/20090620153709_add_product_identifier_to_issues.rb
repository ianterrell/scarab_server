class AddProductIdentifierToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :product_identifier, :string, :limit => 64
  end

  def self.down
    remove_column :issues, :product_identifier
  end
end
