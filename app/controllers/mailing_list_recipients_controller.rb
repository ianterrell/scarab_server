class MailingListRecipientsController < ApplicationController
  resource_controller
  layout 'medium'
  
  create.wants.html { redirect_to root_url }
end
