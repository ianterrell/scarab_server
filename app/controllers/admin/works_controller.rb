class Admin::WorksController < Admin::AdminController
  layout 'admin_app_content'
  
  def create_from_submission
    @work = Work.new :submission_id => params[:submission_id], :issue_id => params[:issue_id], :author_id => params[:author_id]
    render "new"
  end
  
  def audio
    send_file object.audio.path
  end

private

  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
