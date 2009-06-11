class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :body
      t.text :answer
      t.integer :position
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
