class Admin::AdminController < ApplicationController
  resource_controller
  demand "editor"
  layout "admin"
  
  def dashboard
    redirect_to :controller => "issues", :action => "index"
  end
  
protected
  def object_name
    controller_name.singularize
  end
  
  def model_name
    controller_name.singularize
  end
  
  def object_url
    [:admin, object]
  end
  
  def collection_url
    [:admin, collection]
  end
end
