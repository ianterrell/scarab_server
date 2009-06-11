class MailingListRecipient < ActiveRecord::Base
  validates_presence_of :email
  validates_length_of :email, :maximum => 128
  validates_format_of :email, :with => Regex::EMAIL_OK, :message => "is not an email address"
end
