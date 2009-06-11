class CreateMailingListRecipients < ActiveRecord::Migration
  def self.up
    create_table :mailing_list_recipients do |t|
      t.string :email, :limit => 128
      t.timestamps
    end
  end

  def self.down
    drop_table :mailing_list_recipients
  end
end
