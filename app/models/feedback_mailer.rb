class FeedbackMailer < ActionMailer::Base
  def feedback_received(feedback)
    @recipients  = ["ian@scarabmag.com", "brian@scarabmag.com"]
    from       'Scarab <noreply@scarabmag.com>'
    headers    "Reply-to" => 'Scarab <noreply@scarabmag.com>'
    @subject     = "[Scarab] In App Feedback Received"
    @sent_on     = Time.now
    @body[:feedback]  = feedback
  end
end
