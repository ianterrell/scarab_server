# Let's not remove devices from our database once inactive, since we'll be associating
# other information (email) with the tokens.  Let's instead just store their last_feedback_at
# in the database.

require 'apn_on_rails'

class APN::Device < APN::Base
  named_scope :active, :conditions => "((last_feedback_at IS NULL) OR (last_registered_at >= last_feedback_at))"
  named_scope :inactive, :conditions => "((last_feedback_at IS NOT NULL) AND (last_registered_at < last_feedback_at))"
  
  def active?
    last_feedback_at.nil? || (last_registered_at >= last_feedback_at)
  end
  
  def ok_to_email=(x)
    write_attribute('ok_to_email', x == 1)
  end
end

module APN
  module Feedback
    class << self
      def process_devices
        APN::Feedback.devices.each do |device|
          device.update_attribute :last_feedback_at, device.feedback_at
        end
      end
    end 
  end
end