module SubmissionsHelper
  def workflow_button(action, title)
    render :partial => "workflow_button", :locals => { :action => action, :title => title }
  end
end
