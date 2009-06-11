class CreateBios < ActiveRecord::Migration
  def self.up
    create_table :bios do |t|
      t.string :attribution_name, :limit => 64
      t.string :phone, :limit => 16
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bios
  end
end
