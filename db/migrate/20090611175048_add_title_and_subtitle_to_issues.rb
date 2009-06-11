class AddTitleAndSubtitleToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :title, :string, :limit => 32
    add_column :issues, :subtitle, :string, :limit => 128
  end

  def self.down
    remove_column :issues, :subtitle
    remove_column :issues, :title
  end
end
