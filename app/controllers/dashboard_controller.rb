class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @submissions = current_user.submissions.paginate :page => params[:page]
  end
end
