class Admin::InterviewsController < Admin::AdminController
  is_publishable
  
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "published_at DESC"
  end
end