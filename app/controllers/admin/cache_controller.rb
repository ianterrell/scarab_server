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

  def expire_homepage
    expire_page :controller => "/main", :action => :index
  end
  
  def expire_issue_pages
    Issue.published.each do |x|
      expire_page :controller => "/issues", :action => "show", :number => x.number
    end
  end

end
