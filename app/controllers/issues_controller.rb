class IssuesController < ApplicationController
  layout "interior"
  
  caches_page :show
  def show
    @issue = Issue.find_by_number params[:number]
    redirect_to issue_path :number => @current_issue.number and return if @issue.nil? || !@issue.published?
  end
end
