class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.string :alert
      t.integer :badge, :default => 1
      t.boolean :sound, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
