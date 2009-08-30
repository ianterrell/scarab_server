class SubmissionsController < ApplicationController  
  resource_controller

  before_filter :login_required

  def create
    # This feels like a hacktastic mess.
    begin
      Submission.transaction do
        if params[:bio] || current_user.bio.nil?
          @bio = current_user.build_bio params[:bio]
        end
        
        @submission = Submission.new params[:submission]
        @submission.user = current_user
        
        @bio.try(:valid?)
        @submission.valid?
        
        @submission.save! && @bio.try(:save!)
        
        flash[:success] = "Thank you for your submission!"
        redirect_to dashboard_url
      end
    rescue ActiveRecord::RecordInvalid
      render :action => "new"
    end
  end
end
