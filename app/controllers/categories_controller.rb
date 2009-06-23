class CategoriesController < ApplicationController
  resource_controller
  demand "editor"
  
  create.wants.html { redirect_to categories_path }
  update.wants.html { redirect_to categories_path }
end
