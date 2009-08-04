class Admin::FootnotesController < Admin::AdminController
  belongs_to :interview
  create.wants.html { redirect_to [:admin, parent_object] }
  update.wants.html { redirect_to [:admin, parent_object] }
  destroy.wants.html { redirect_to [:admin, parent_object] }
end
