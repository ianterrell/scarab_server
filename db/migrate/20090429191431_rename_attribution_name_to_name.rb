class RenameAttributionNameToName < ActiveRecord::Migration
  def self.up
    rename_column :bios, :attribution_name, :name
  end

  def self.down
    rename_column :bios, :name, :attribution_name
  end
end
