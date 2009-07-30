class RemovePublishedAtFromAuthors < ActiveRecord::Migration
  def self.up
    remove_column :authors, :published_at
  end

  def self.down
    add_column :authors, :published_at, :datetime
  end
end
