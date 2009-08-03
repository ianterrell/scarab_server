class Api::V1::ApiController < ApplicationController
  before_filter :require_xml
  
protected
  def require_xml
    head :not_implemented and return false if params[:format] != "xml"
  end
end
