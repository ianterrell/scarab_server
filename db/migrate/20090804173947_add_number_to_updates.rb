class AddNumberToUpdates < ActiveRecord::Migration
  def self.up
    add_column :updates, :number, :integer
  end

  def self.down
    remove_column :updates, :number
  end
end
