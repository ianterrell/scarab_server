class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://#{SETTINGS[:fqdn]}/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://#{SETTINGS[:fqdn]}/dashboard"
  end
  
  def reset_password(user)
    setup_email(user)
    @subject    += 'Please reset your password'
    @body[:url]  = "http://#{SETTINGS[:fqdn]}/reset/#{user.reset_code}"
  end
  
protected
  def setup_email(user)
    content_type "text/html"
    @recipients  = user.email
    from       'Scarab <noreply@scarabmag.com>'
    headers    "Reply-to" => 'Scarab <noreply@scarabmag.com>'
    @subject     = "[Scarab] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
