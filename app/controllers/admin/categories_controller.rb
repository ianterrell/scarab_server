class Admin::CategoriesController < Admin::AdminController  
  create.wants.html { redirect_to categories_path }
  update.wants.html { redirect_to categories_path }
end
