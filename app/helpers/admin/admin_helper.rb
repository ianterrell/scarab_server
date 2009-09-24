module Admin::AdminHelper
  def expire_cache_button(page)
    render :partial => "admin/cache/expire_button", :locals => { :page => page }
  end
end