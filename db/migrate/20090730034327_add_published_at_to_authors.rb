class AddPublishedAtToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :published_at, :datetime
  end

  def self.down
    remove_column :authors, :published_at
  end
end
