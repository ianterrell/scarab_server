class Admin::QuestionsController < Admin::AdminController  
  create.wants.html { redirect_to questions_path }
  update.wants.html { redirect_to questions_path }
end
