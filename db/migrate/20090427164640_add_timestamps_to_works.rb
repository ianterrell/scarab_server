class AddTimestampsToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :promoted_at, :datetime
    add_column :works, :rejected_at, :datetime
    add_column :works, :accepted_at, :datetime
  end

  def self.down
    remove_column :works, :accepted_at
    remove_column :works, :rejected_at
    remove_column :works, :promoted_at
  end
end
