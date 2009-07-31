class AddUserIdToAuthor < ActiveRecord::Migration
  def self.up
    add_column :authors, :user_id, :integer
  end

  def self.down
    remove_column :authors, :user_id
  end
end
