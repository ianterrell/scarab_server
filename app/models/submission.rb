require 'aasm'

class Submission < ActiveRecord::Base
  belongs_to :user
  has_one :work
  
  has_attached_file :document
  
  validates_presence_of :user_id, :title, :agree_to_terms
  validates_length_of :title, :maximum => 512
  
  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 5.megabytes
  #validates_attachment_content_type :document, :content_type => ['text/plain', 'application/msword', 'application/pdf', 'application/rtf'], :message => "must be a Word document, PDF, RTF, or text file"
  
  validate :bio_filled_out
  
  attr_protected :user_id, :issue_id, :state
  
  def attribution
    user.bio ? user.bio.name : user.email
  end
  
  def bio_filled_out
    self.errors.add :base, "Bio must be filled out" if user && user.bio.nil?
  end
  
  named_scope :unassigned, :include => :work, :conditions => "state = 'accepted' and works.submission_id IS NULL"
  def unassigned?
    accepted? && work.nil?
  end
  
  ###
  # State machine
  include AASM
  
  # 4 States:  1st reading, 2nd reading, rejected, accepted
  # Rejection events send different letters depending
  # Otherwise, events are on entering states
  
  aasm_column :state
  aasm_initial_state :first_reading
  aasm_state :first_reading
  aasm_state :second_reading, :enter => :do_promote
  aasm_state :rejected, :enter => :do_reject
  aasm_state :accepted, :enter => :do_accept
  
  # From first reading...
  
  aasm_event :reject_discourage, :success => :deliver_rejected_discourage do
    transitions :from => :first_reading, :to => :rejected
  end
  
  aasm_event :reject_neutral, :success => :deliver_rejected_neutral do
    transitions :from => :first_reading, :to => :rejected
  end
  
  aasm_event :reject_encourage, :success => :deliver_rejected_encourage do
    transitions :from => :first_reading, :to => :rejected
  end

  aasm_event :promote do
    transitions :from => :first_reading, :to => :second_reading
  end
  
  # From second reading...
  
  aasm_event :reject, :success => :deliver_rejected_from_second_reading do
    transitions :from => :second_reading, :to => :rejected 
  end
  
  aasm_event :accept do
    transitions :from => :second_reading, :to => :accepted
  end
  
  after_create :send_first_notification

  def send_first_notification
    if user.has_promise?
      update_attribute :state, 'second_reading'
      update_attribute :promoted_at, created_at
      SubmissionNotificationsMailer.deliver_received_with_promise(self)
    else    
      SubmissionNotificationsMailer.deliver_received(self)
    end
  end

  [:deliver_rejected_discourage, :deliver_rejected_neutral, :deliver_rejected_encourage, :deliver_rejected_from_second_reading].each do |msg|
    define_method msg do
      SubmissionNotificationsMailer.send(msg, self)
    end
  end

  def do_promote
    update_attribute :promoted_at, Time.now
    user.update_attribute :has_promise, true unless user.has_promise?
    SubmissionNotificationsMailer.deliver_promoted(self)
  end
  
  def do_reject
    update_attribute :rejected_at, Time.now
  end

  def do_accept
    update_attribute :accepted_at, Time.now
    SubmissionNotificationsMailer.deliver_accepted(self)
  end
  
  def state_for_display
    if state =~ /rejected/i
      "Rejected"
    else
      state.titleize
    end
  end
  
  def reading?
    state =~ /reading/i
  end
end
