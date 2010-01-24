class Admin::Reports::QuartersController < Admin::Reports::ReportsController
  def generate_royalty_payments
    @quarter = Quarter.find params[:id]
    if @quarter.royalty_payments.empty? && !@quarter.apple_payments.empty? && (@quarter.apple_payments.total != 0)
      @quarter.apple_payments.each do |apple_payment|
        apple_payment.issue_payment_portions.each do |issue_payment_portion|
          issue_payment_portion.issue.authors.each do |author|
            @royalty_payment = @quarter.royalty_payments.find_by_author_id(author.id) || @quarter.royalty_payments.create(:author => author)
            @royalty_payment.amount += RoyaltyPayment::AUTHOR_ROYALTY_PORTION * issue_payment_portion.amount
            @royalty_payment.save
          end
        end
      end
      flash[:success] = "Royalties generated."
      redirect_to admin_reports_quarter_royalty_payments_path(@quarter)
    else
      flash[:error] = "#{@quarter.name} has no payments to generate royalties for."
      redirect_to admin_reports_quarters_path
    end
  end
end
