class Admin::CategoriesController < Admin::AdminController  
  layout 'admin_faq_content'
    
  create.wants.html { redirect_to admin_categories_path }
  update.wants.html { redirect_to admin_categories_path }
  destroy.success.wants.html { redirect_to admin_categories_path }
end
