class WorksController < ApplicationController
  resource_controller
  
  before_filter :login_required
  permit "editor", :only => [:index, :edit, :update, :reject, :reject_with_promise, :promote, :accept]
  
  def create
    begin
      Work.transaction do
        if params[:bio] || current_user.bio.nil?
          @bio = current_user.build_bio params[:bio]
        end
        
        @work = Work.new params[:work]
        @work.user = current_user
        
        @bio.try(:valid?)
        @work.valid?
        
        @work.save! && @bio.try(:save!)
        
        flash[:success] = "Thank you for your submission!"
        redirect_to dashboard_url
      end
    rescue ActiveRecord::RecordInvalid
      render :action => "new"
    end
  end
  
  def collection
    unless params[:state].blank?
      @collection ||= Work.paginate :conditions => { :state => params[:state] }, :page => params[:page]
    else
      @collection ||= Work.paginate :page => params[:page]
    end
  end
  
  [:reject_discourage, :reject_neutral, :reject_encourage, :promote, :reject, :accept].each do |transition|
    define_method transition do      
      @work = Work.find params[:id]
      @work.send(:"#{transition}!")
      flash[:success] = "#{transition.to_s.humanize}: #{@work.title}"
      
      next_work = nil
      if params[:state]
        next_work = Work.find :first, :conditions => { :state => params[:state] }, :order => :created_at
      end
      
      redirect_to next_work ? next_work : works_path(:state => params[:state])
    end
  end
  
end
