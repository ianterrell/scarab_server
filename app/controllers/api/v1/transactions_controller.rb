class TransactionsController < Api::V1::ApiController
  resource_controller
  actions :create
  create.success.wants.xml { render :xml => object }
  create.failure.wants.xml { render :xml => object.errors }
end
