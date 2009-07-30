class CreateNewWorks < ActiveRecord::Migration
  def self.up
    create_table :works, :force => true do |t|
      t.string :title
      t.text :body
      t.integer :author_id, :issue_id
      t.timestamps
    end
    add_index :works, :issue_id
    add_column :submissions, :work_id, :integer
  end

  def self.down
    remove_index :works, :issue_id
    remove_column :submissions, :work_id
    drop_table :works
  end
end
