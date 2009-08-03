class Admin::AuthorsController < Admin::AdminController
  belongs_to :issue
  
  def create_from_user
    user = User.find params[:user_id]
    @author = Author.new
    @author.name = user.bio.name
    @author.bio = user.bio.body
    @author.user = user
    render "new"
  end
  
private
  def model_name
    'author'
  end

  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page]
  end
end
