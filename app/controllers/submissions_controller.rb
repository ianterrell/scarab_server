class SubmissionsController < ApplicationController
  resource_controller
  
  before_filter :login_required
  permit "editor", :only => [:index, :edit, :update, :reject, :reject_with_promise, :promote, :accept]
  
  def create
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
  
  def collection
    unless params[:state].blank?
      @collection ||= Submission.paginate :conditions => { :state => params[:state] }, :page => params[:page]
    else
      @collection ||= Submission.paginate :page => params[:page]
    end
  end
  
  [:reject_discourage, :reject_neutral, :reject_encourage, :promote, :reject, :accept].each do |transition|
    define_method transition do      
      @submission = Submission.find params[:id]
      @submission.send(:"#{transition}!")
      flash[:success] = "#{transition.to_s.humanize}: #{@submission.title}"
      
      next_submission = nil
      if params[:state]
        next_submission = Submission.find :first, :conditions => { :state => params[:state] }, :order => :created_at
      end
      
      redirect_to next_submission ? next_submission : submissions_path(:state => params[:state])
    end
  end
  
end
