class Admin::IssuesController < Admin::AdminController
  is_publishable
  layout 'admin_app_content'
  
  def sort
    params[:issue_works].each_with_index do |id, index|
      w = Work.find id
      w.update_attribute :position, index + 1
    end
    render(:update) { |page| page.visual_effect :highlight, :issue_works }
  end
  
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "number DESC"
  end
end
