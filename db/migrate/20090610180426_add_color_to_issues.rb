class AddColorToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :color, :string, :limit => 6
  end

  def self.down
    remove_column :issues, :color
  end
end
