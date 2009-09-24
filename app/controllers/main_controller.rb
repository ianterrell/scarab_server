class MainController < ApplicationController
  layout "leftcallouts"
  caches_page :index
  def index; end
  
  def who
    render :template => "/main/who", :layout => "interior"
  end
end
