class SubmissionNotificationsMailer < ActionMailer::Base
  
  def received(work)
    subject    '[Scarab] Your submission has been received'
    setup_mail(work)
  end

  def received_with_promise(work)
    subject    '[Scarab] Your submission has been received'
    setup_mail(work)
  end
  
  def rejected_discourage(work)
    subject    '[Scarab] Update on your submission'
    setup_mail(work)
  end
  
  def rejected_neutral(work)
    subject    '[Scarab] Update on your submission'
    setup_mail(work)
  end
  
  def rejected_encourage(work)
    subject    '[Scarab] Update on your submission'
    setup_mail(work)
  end

  def promoted(work)
    subject    '[Scarab] Update on your submission'
    setup_mail(work)
  end

  def rejected_from_second_reading(work)
    subject    '[Scarab] Update on your submission'
    setup_mail(work)
  end
  
  def accepted(work)
    subject    '[Scarab] Your work has been accepted!'
    setup_mail(work)
  end

private

  def setup_mail(work)
    recipients work.user.email
    from       'Scarab <noreply@scarabmag.com>'
    headers    "Reply-to" => 'Scarab <noreply@scarabmag.com>'
    content_type "text/html"
    sent_on    Time.now
    body       :user => work.user, :work => work
  end

end
