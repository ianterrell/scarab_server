class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer :user_id, :issue_id
      t.string :state, :limit => 64
      t.string :title, :limit => 512
      t.text :body
      t.boolean :agree_to_terms, :default => false
      t.boolean :prose, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
