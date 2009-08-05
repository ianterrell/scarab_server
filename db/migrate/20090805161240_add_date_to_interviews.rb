class AddDateToInterviews < ActiveRecord::Migration
  def self.up
    add_column :interviews, :date, :string
  end

  def self.down
    remove_column :interviews, :date
  end
end
