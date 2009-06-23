class TransactionsController < ApplicationController
  resource_controller
  actions :create
  
  demand "editor", :except => [:published_since_number]
end
