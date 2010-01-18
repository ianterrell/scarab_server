class ChangeFeedbackTextToText < ActiveRecord::Migration
  def self.up
    change_column :feedbacks, :text, :text
  end

  def self.down
    change_column :feedbacks, :text, :string
  end
end
