class AddHasPromiseToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :has_promise, :boolean, :default => false
  end

  def self.down
    remove_column :users, :has_promise
  end
end
