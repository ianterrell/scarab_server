class Admin::QuestionsController < Admin::AdminController  
  layout 'admin_faq_content'

  create.wants.html { redirect_to admin_questions_path }
  update.wants.html { redirect_to admin_questions_path }
  destroy.success.wants.html { redirect_to admin_questions_path }
end
