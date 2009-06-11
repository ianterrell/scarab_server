class RemoveNameFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :name
  end

  def self.down
    add_column :users, :name, :string,       :limit => 64
  end
end
