class Api::V1::DevicesController < Api::V1::ApiController
  # Sort of fuzzy naming here to fit ObjectiveResource & REST.  
  # Really more like create_or_update
  def create
    @device = APN::Device.find_by_token(params[:device][:token]) || APN::Device.new(params[:device])
    @device.last_registered_at = Time.now
    if @device.save
      render :xml => @device.to_xml(:only => [:id])
    else
      render :xml => @device.errors
    end
  end
end
