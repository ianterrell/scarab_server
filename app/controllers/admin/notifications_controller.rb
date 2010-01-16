class Admin::NotificationsController < Admin::AdminController
  create.wants.html { redirect_to admin_notifications_path }

private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "created_at DESC"
  end

end
