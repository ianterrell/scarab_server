class AddProseMarkerToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :prose, :boolean, :default => false
  end

  def self.down
    remove_column :works, :prose
  end
end
