class Admin::QuestionsController < Admin::AdminController  
  create.wants.html { redirect_to admin_questions_path }
  update.wants.html { redirect_to admin_questions_path }
  destroy.success.wants.html { redirect_to admin_questions_path }
end
