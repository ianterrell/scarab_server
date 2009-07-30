class AuthorsController < ApplicationController
  resource_controller
  
  demand "editor"
  
  show.success.wants.xml { render :xml => object }
  
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
