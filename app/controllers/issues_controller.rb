class IssuesController < ApplicationController
  layout "interior"
  
  def show
    @issue = Issue.find_by_number params[:number]
  end
end
