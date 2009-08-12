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

  def self.is_publishable
    class_eval <<-CODE
      def publish
        @#{controller_name.singularize} = model_name.capitalize.constantize.find params[:id]
        if request.post?
          if @#{controller_name.singularize}.update_attributes params[:#{controller_name.singularize}]
            flash[:success] = "Scheduled for publication at \#{@#{controller_name.singularize}.published_at.to_s(:short)}"
            redirect_to [:admin, @#{controller_name.singularize}]
          else
            flash[:error] = "Could not schedule for publication."
            render 'publish'
          end
        end
      end
    CODE
  end
end
