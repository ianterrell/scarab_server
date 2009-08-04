class Admin::InterviewsController < Admin::AdminController
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "published_at DESC"
  end
end