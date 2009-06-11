class QuestionsController < ApplicationController
  resource_controller
  before_filter :login_required
  permit "editor"
  
  create.wants.html { redirect_to questions_path }
  update.wants.html { redirect_to questions_path }
end
