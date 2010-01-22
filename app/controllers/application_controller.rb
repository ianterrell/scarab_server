# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem
  
  include SslRequirement
  
  before_filter :get_current_issue

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
protected
  def get_current_issue
    @current_issue = Issue.published.first :order => "number desc"
  end
  
  def self.demand(who, options={})
    class_eval <<-CODE
      with_options(#{options.inspect}) do |auth|
        auth.before_filter :login_required
        auth.permit #{who.inspect}
      end
    CODE
  end
  
end
