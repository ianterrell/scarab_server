class AddReaderToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :reader, :string
  end

  def self.down
    remove_column :works, :reader
  end
end
