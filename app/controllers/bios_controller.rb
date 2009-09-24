class BiosController < ApplicationController
  layout "contributor"
  
  resource_controller
  before_filter :login_required
  
  create.before do
    @bio.user = current_user
  end
  
  create.wants.html { redirect_to dashboard_path }
  update.wants.html { redirect_to dashboard_path }
  
  def object
    @object ||= current_user.bio || current_user.build_bio
  end
end
