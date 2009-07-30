class WorksController < ApplicationController
  resource_controller  
  
  demand "editor"

private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
