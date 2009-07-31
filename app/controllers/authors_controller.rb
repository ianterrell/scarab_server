class AuthorsController < ApplicationController
  resource_controller
  
  belongs_to :issue
  
  demand "editor", :except => [:index, :show]
  
  index.wants.html do
    redirect_to root_path unless permit?("editor")
  end
  index.wants.xml { render :xml => collection }
  
  show.success.wants.xml { render :xml => object }
  show.success.wants.html do
    redirect_to root_path unless permit?("editor")
  end
  
  def create_from_user
    user = User.find params[:user_id]
    @author = Author.new
    @author.name = user.bio.name
    @author.bio = user.bio.body
    @author.user = user
    render "new"
  end
  
private
  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
