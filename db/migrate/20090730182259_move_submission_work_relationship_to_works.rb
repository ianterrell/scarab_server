class MoveSubmissionWorkRelationshipToWorks < ActiveRecord::Migration
  def self.up
    remove_column :submissions, :work_id
    add_column :works, :submission_id, :integer
  end

  def self.down
    remove_column :works, :submission_id
    add_column :submissions, :work_id, :integer
  end
end
