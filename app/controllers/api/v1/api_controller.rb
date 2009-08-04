class Api::V1::ApiController < ApplicationController
  before_filter :require_xml
  
protected
  def require_xml
    head :not_implemented and return false if params[:format] != "xml"
  end
  
  def self.expose_published_since_number
    class_eval <<-CODE
      #caches_page :published_since_number
      def published_since_number
        render :xml => controller_name.singularize.camelize.constantize.published.since_number(params[:number])
      end
    CODE
  end
end
