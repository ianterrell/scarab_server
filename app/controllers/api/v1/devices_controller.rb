class Api::V1::DevicesController < Api::V1::ApiController
  def create
    @device = APN::Device.new params[:device]
    success = if (@existing_device = APN::Device.find_by_token @device.token)
      @device = @existing_device
      @device.update_attribute :last_registered_at, Time.now
    else
      @device.save
    end
    if (success)
      render :xml => @device.to_xml(:only => [:id])
    else
      render :xml => @device.errors
    end
  end
end
