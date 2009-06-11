class CategoriesController < ApplicationController
  resource_controller
  before_filter :login_required
  permit "editor"
  
  create.wants.html { redirect_to categories_path }
  update.wants.html { redirect_to categories_path }
end
