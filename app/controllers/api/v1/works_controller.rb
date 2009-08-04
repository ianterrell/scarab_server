class Api::V1::WorksController < Api::V1::ApiController
  before_filter :require_issue, :only => :index
  before_filter :require_valid_transaction, :only => :index  # show/audio restrict content based on free/pay
  
  skip_before_filter :require_xml, :only => :audio
  
  resource_controller
  actions :index, :show
  
  belongs_to :issue
  
  index.wants.xml { render :xml => collection }
  
  show.wants.xml do
    if object.free?
      render :xml => object 
    else
      render :xml => object.to_xml(:only => [:id, :free, :title, :author_id, :prose])  # TODO: bound to be a better way using the customize_xml_json helper
    end
  end
  
  def audio
    params[:issue_id] = object.issue.id
    return unless object.free? || require_valid_transaction
    send_file object.audio.path
  end
  
protected
  def require_issue
    head :forbidden and return false unless parent?
  end
  
  def require_valid_transaction
    # need an id
    head :forbidden and return false unless params[:tid]
    
    # need a transaction
    transaction = Transaction.find_by_identifier params[:tid]
    head :forbidden and return false unless transaction
    
    # issues should match
    head :forbidden and return false unless transaction.issue.id == params[:issue_id].to_i
    
    # all good
    return true
  end
end
