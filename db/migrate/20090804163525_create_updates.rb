class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.datetime :published_at
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :updates
  end
end
