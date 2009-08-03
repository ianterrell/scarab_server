class RenameIssueDescriptionToPreviewDescription < ActiveRecord::Migration
  def self.up
    rename_column :issues, :description, :preview_description
  end

  def self.down
    rename_column :issues, :preview_description, :description
  end
end
