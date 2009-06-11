class MainController < ApplicationController
  layout nil
  
  def index
    @mailing_list_recipient = MailingListRecipient.new
  end
  
  def learn_more
    render :template => "main/learn_more", :layout => 'medium'
  end
  
  def privacy
    render :template => "main/privacy", :layout => 'medium'
  end
end
