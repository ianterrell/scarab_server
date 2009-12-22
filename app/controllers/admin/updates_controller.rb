class Admin::UpdatesController < Admin::AdminController
  is_publishable
  layout 'admin_app_content'
    
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "published_at DESC"
  end
end
