class FeedbackObserver < ActiveRecord::Observer
  def after_create(feedback)
    FeedbackMailer.deliver_feedback_received feedback
  end

  # Really just for initial feedback that's already been received
  def after_save(user)
    FeedbackMailer.deliver_feedback_received feedback
  end
end
