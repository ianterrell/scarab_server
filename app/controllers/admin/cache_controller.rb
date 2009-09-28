class Admin::CacheController < Admin::AdminController
  def index; end
  
  def expire
    if !request.post?
      flash[:error] = "Must be a POST!"
    elsif self.respond_to? :"expire_#{params[:page]}"
      self.send :"expire_#{params[:page]}"
      flash[:success] = "Successfully expired."
    else
      flash[:error] = "What are you trying to expire?"
    end
    redirect_to admin_cache_control_path and return
  end
  
protected

  def expire_all_web_content
    expire_homepage
    expire_issue_pages
  end

  def expire_homepage
    expire_page :controller => "/main", :action => :index
  end
  
  def expire_issue_pages
    Issue.published.each do |issue|
      expire_page :controller => "/issues", :action => "show", :number => issue.number
    end
  end
  
  def expire_all_api_content
    expire_api_issue_authors
    expire_api_authors
    expire_api_interview_footnotes
    expire_api_interviews
    expire_api_issues
    expire_api_updates
  end
  
  def expire_api_issue_authors
    Issue.published.each do |issue|
      expire_page :controller => "/api/v1/authors", :action => "index", :issue_id => issue.id
    end
  end
  
  def expire_api_authors
    Author.all.each do |author|
      expire_page :controller => "/api/v1/authors", :action => "show", :id => author.id
    end
  end
  
  def expire_api_interview_footnotes
    Interview.published.each do |interview|
      expire_page :controller => "/api/v1/footnotes", :action => "index", :interview_id => interview.id
    end
  end
  
  def expire_api_interviews
    (0..Interview.published.last.number).each do |n|
      expire_page :controller => "/api/v1/interviews", :action => "published_since_number", :number => n
    end
  end

  def expire_api_issues
    (0..Issue.published.last.number).each do |n|
      expire_page :controller => "/api/v1/issues", :action => "published_since_number", :number => n
    end
  end
  
  def expire_api_updates
    (0..Update.published.last.number).each do |n|
      expire_page :controller => "/api/v1/updates", :action => "published_since_number", :number => n
    end
  end

end
