class CreateInterviews < ActiveRecord::Migration
  def self.up
    create_table :interviews do |t|
      t.integer :number, :author_id
      t.text :body
      t.datetime :published_at
      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end
