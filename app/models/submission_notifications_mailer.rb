class SubmissionNotificationsMailer < ActionMailer::Base
  
  def received(submission)
    subject    '[Scarab] Your submission has been received'
    setup_mail(submission)
  end

  def received_with_promise(submission)
    subject    '[Scarab] Your submission has been received'
    setup_mail(submission)
  end
  
  def rejected_discourage(submission)
    subject    '[Scarab] Update on your submission'
    setup_mail(submission)
  end
  
  def rejected_neutral(submission)
    subject    '[Scarab] Update on your submission'
    setup_mail(submission)
  end
  
  def rejected_encourage(submission)
    subject    '[Scarab] Update on your submission'
    setup_mail(submission)
  end

  def promoted(submission)
    subject    '[Scarab] Update on your submission'
    setup_mail(submission)
  end

  def rejected_from_second_reading(submission)
    subject    '[Scarab] Update on your submission'
    setup_mail(submission)
  end
  
  def accepted(submission)
    subject    '[Scarab] Your work has been accepted!'
    setup_mail(submission)
  end

private

  def setup_mail(submission)
    recipients submission.user.email
    from       'Scarab <noreply@scarabmag.com>'
    headers    "Reply-to" => 'Scarab <noreply@scarabmag.com>'
    content_type "text/html"
    sent_on    Time.now
    body       :user => submission.user, :submission => submission
  end

end
