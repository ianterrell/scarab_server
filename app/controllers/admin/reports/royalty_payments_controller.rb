class Admin::Reports::RoyaltyPaymentsController < Admin::Reports::ReportsController
  belongs_to :quarter, :author
  
  def mark_paid
    @royalty_payment = RoyaltyPayment.find params[:id]
    if @royalty_payment.paid?
      flash[:error] = "This royalty payment has already been paid!"
    else
      @royalty_payment.update_attribute :paid_at, Time.now
      flash[:success] = "Payment to #{@royalty_payment.author.name} for #{StringUtils.money(@royalty_payment.amount)} marked paid!"
    end
    redirect_to :back
  end
end
