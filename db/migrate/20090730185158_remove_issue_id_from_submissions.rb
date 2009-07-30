class RemoveIssueIdFromSubmissions < ActiveRecord::Migration
  def self.up
    remove_column :submissions, :issue_id
  end

  def self.down
    add_column :submissions, :issue_id, :integer
  end
end
