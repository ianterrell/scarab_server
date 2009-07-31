class IssuesController < ApplicationController
  resource_controller
  
  demand "editor", :except => [:published_since_number]
  
  caches_page :published_since_number
  def published_since_number
    @issues = Issue.published.since_number params[:number]
    respond_to do |format|
      format.xml { render :xml => @issues }
    end
  end
  
  def sort
    params[:issue_works].each_with_index do |id, index|
      w = Work.find id
      w.update_attribute :position, index + 1
    end
    render(:update) { |page| page.visual_effect :highlight, :issue_works }
  end
  
private

  def collection
    @collection ||= end_of_association_chain.paginate :all, :page => params[:page], :order => "number DESC"
  end

end
