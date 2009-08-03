class Api::V1::IssuesController < Api::V1::ApiController
  #caches_page :published_since_number
  def published_since_number
    @issues = Issue.published.since_number params[:number]
    render :xml => @issues
  end
end
