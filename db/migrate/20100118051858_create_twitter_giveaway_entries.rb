class CreateTwitterGiveawayEntries < ActiveRecord::Migration
  def self.up
    create_table :twitter_giveaway_entries do |t|
      t.string :username
      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_giveaway_entries
  end
end
