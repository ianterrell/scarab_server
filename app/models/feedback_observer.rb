class FeedbackObserver < ActiveRecord::Observer
  def after_save(feedback)
    FeedbackMailer.deliver_feedback_received feedback
  end
end
