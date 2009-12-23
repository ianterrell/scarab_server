class CreateQuarters < ActiveRecord::Migration
  def self.up
    create_table :quarters do |t|
      t.string :name, :limit => 32
      t.timestamps
    end
  end

  def self.down
    drop_table :quarters
  end
end
