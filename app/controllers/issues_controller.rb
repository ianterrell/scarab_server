class IssuesController < ApplicationController
  layout "interior"
  
  caches_page :show
  def show
    @issue = Issue.find_by_number params[:number]
  end
end
