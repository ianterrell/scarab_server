class RemoveBodyFromWorks < ActiveRecord::Migration
  def self.up
    remove_column :works, :body
  end

  def self.down
    add_column :works, :body, :string
  end
end
