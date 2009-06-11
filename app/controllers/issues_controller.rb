class IssuesController < ApplicationController
  with_options :except => [:published_since_number] do |auth|
    auth.before_filter :login_required
    auth.permit "editor"
  end
  
  def index
    
  end
  
  caches_page :published_since_number
  def published_since_number
    @issues = Issue.published.since_number params[:number]
    respond_to do |format|
      format.xml { render :xml => @issues }
    end
  end
end
