class AddLocationToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :location, :string
  end

  def self.down
    remove_column :authors, :location
  end
end
