class CreateFootnotes < ActiveRecord::Migration
  def self.up
    create_table :footnotes do |t|
      t.integer :interview_id
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :footnotes
  end
end
