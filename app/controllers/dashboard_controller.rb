class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @works = current_user.works.paginate :page => params[:page]
  end
end
