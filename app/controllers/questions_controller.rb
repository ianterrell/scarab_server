class QuestionsController < ApplicationController
  resource_controller
  demand "editor"
  
  create.wants.html { redirect_to questions_path }
  update.wants.html { redirect_to questions_path }
end
