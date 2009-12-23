class Admin::Reports::IssuePaymentPortionsController < Admin::Reports::ReportsController
  belongs_to :apple_payment, :issue
  
  create.wants.html { redirect_to [:admin, :reports, @apple_payment] }
  update.wants.html { redirect_to [:admin, :reports, @apple_payment] }
end
