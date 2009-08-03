class Api::V1::WorksController < Api::V1::ApiController
  # TODO restrict by valid transaction

  resource_controller
  actions :index, :show
  
  belongs_to :issue
  
  index.wants.xml { render :xml => collection }
  
  show.wants.xml do
    if object.free?
      render :xml => object 
    else
      render :xml => object.to_xml(:only => [:id, :free, :title, :author_id, :prose])  # TODO: bound to be a better way using the customize_xml_json helper
    end
  end
end
