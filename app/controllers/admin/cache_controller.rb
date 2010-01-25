class Admin::CacheController < Admin::AdminController
  def index; end
  
  def expire
    if !request.post?
      flash[:error] = "Must be a POST!"
    else
      FileUtils.rm_rf "#{RAILS_ROOT}/public/cache"
      flash[:success] = "Cache expired."
    end
    redirect_to admin_cache_control_path
  end

end
