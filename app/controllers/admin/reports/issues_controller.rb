class Admin::Reports::IssuesController < Admin::Reports::ReportsController
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :per_page => 20, :order => "number desc"
  end
end
