class WorksController < ApplicationController
  resource_controller  
  
  belongs_to :issue
  
  demand "editor", :except => [:index]
  
  before_filter :check_for_valid_transaction, :only => :index
  
  index.wants.xml { render :xml => collection }

  def create_from_submission
    @work = Work.new :submission_id => params[:submission_id], :issue_id => params[:issue_id], :author_id => params[:author_id]
    render "new"
  end

private
  def check_for_valid_transaction
    # TODO
  end

  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
