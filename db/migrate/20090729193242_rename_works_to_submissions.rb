class RenameWorksToSubmissions < ActiveRecord::Migration
  def self.up
    rename_table :works, :submissions
  end

  def self.down
    rename_table :submissions, :works
  end
end
