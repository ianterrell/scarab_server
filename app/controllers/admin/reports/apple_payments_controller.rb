class Admin::Reports::ApplePaymentsController < Admin::Reports::ReportsController
  belongs_to :quarter
  
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :per_page => 20
  end
end
