class FaqController < ApplicationController
  layout "contributor"
  
  before_filter :login_required
  
  def index
    @categories = Category.find :all, :include => :questions
  end
end
