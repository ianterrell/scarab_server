class Admin::SubmissionsController < Admin::AdminController
  resource_controller

  def unassigned
    @submissions ||= Submission.unassigned.paginate :page => params[:page]
  end

  def collection
    unless params[:state].blank?
      @collection ||= Submission.paginate :conditions => { :state => params[:state] }, :page => params[:page]
    else
      @collection ||= Submission.paginate :page => params[:page]
    end
  end

  [:reject_discourage, :reject_neutral, :reject_encourage, :promote, :reject, :accept].each do |transition|
    define_method transition do      
      @submission = Submission.find params[:id]
      @submission.send(:"#{transition}!")
      flash[:success] = "#{transition.to_s.humanize}: #{@submission.title}"

      next_submission = nil
      if params[:state]
        next_submission = Submission.find :first, :conditions => { :state => params[:state] }, :order => :created_at
      end

      redirect_to next_submission ? [:admin, next_submission] : admin_submissions_path(:state => params[:state])
    end
  end

end
