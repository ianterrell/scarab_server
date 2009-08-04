class Api::V1::TransactionsController < Api::V1::ApiController
  resource_controller
  actions :create
  create.success.wants.xml { render :xml => object.to_xml(:only => [:id] ) }
  create.failure.wants.xml { render :xml => object.errors }
end
