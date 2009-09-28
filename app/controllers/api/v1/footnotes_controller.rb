class Api::V1::FootnotesController < Api::V1::ApiController
  resource_controller
  belongs_to :interview
  actions :index
  caches_page :index
  index.wants.xml { render :xml => collection }
end
