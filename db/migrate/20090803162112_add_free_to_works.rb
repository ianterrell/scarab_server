class AddFreeToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :free, :boolean, :default => false
  end

  def self.down
    remove_column :works, :free
  end
end
