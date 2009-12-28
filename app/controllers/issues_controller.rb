class IssuesController < ApplicationController
  layout "interior"
  
  caches_page :show
  def show
    @issue = Issue.find_by_number params[:number]
    redirect_to issue_path :number => @current_issue.number and return if @issue.nil? || !@issue.published?
    if @issue
      @previous_issue = Issue.find_by_number @issue.number - 1
      @previous_issue = nil unless @previous_issue && @previous_issue.published?
      @next_issue = Issue.find_by_number @issue.number + 1
      @next_issue = nil unless @next_issue && @next_issue.published?
    end
  end
end
