class TransactionsController < ApplicationController
  resource_controller
  actions :create
  demand "editor", :except => [:create]
  create.success.wants.xml { render :xml => object }
  create.failure.wants.xml { render :xml => object.errors }
end
