class AddWebBioToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :web_bio, :text
  end

  def self.down
    remove_column :authors, :web_bio
  end
end
