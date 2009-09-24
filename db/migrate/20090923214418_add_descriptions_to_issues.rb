class AddDescriptionsToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :short_web_description, :text
    add_column :issues, :long_web_description, :text
  end

  def self.down
    remove_column :issues, :long_web_description
    remove_column :issues, :short_web_description
  end
end
