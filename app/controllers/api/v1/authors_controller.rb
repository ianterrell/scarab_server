class Api::V1::AuthorsController < Api::V1::ApiController
  resource_controller
  actions :index, :show
  
  caches_page :index
  caches_page :show
  
  belongs_to :issue
  
  index.wants.xml { render :xml => collection }
  show.wants.xml { render :xml => object }
end
