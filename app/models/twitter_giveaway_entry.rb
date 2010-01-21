class TwitterGiveawayEntry < ActiveRecord::Base
  validates_uniqueness_of :username
end
