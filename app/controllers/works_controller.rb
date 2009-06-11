class WorksController < ApplicationController
  resource_controller
  
  before_filter :login_required
  permit "editor", :only => [:index, :edit, :update, :reject, :reject_with_promise, :promote, :accept]
  
  create.before do
    if params[:bio] || current_user.bio.nil?
      @bio = current_user.create_bio params[:bio]
    end
    
    @work.user = current_user
  end
  create.wants.html { redirect_to dashboard_url }
  
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
