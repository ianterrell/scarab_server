class AddWorkTypeToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :work_type, :string
  end

  def self.down
    remove_column :works, :work_type
  end
end
