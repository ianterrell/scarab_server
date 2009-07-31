class AddPositionToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :position, :integer, :default => 1
  end

  def self.down
    remove_column :works, :position
  end
end
