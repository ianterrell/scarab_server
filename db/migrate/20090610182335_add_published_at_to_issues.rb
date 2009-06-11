class AddPublishedAtToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :published_at, :datetime
  end

  def self.down
    remove_column :issues, :published_at
  end
end
