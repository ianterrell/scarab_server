class Api::V1::DevicesController < Api::V1::ApiController
  # Sort of fuzzy naming here to fit ObjectiveResource & REST.  
  # Really more like create_or_update
  # This implementation is highly dependent on the client code -- sorry!
  #
  # Devices' last_registered_at must be updated every time the app is opened
  # in order for the push notifications to have the most up to date data.
  #
  # Also:  Devices are used for promotions in app -- so the email and mailing
  # list preferences can get set on each update!
  def create
    @device = APN::Device.find_by_token(params[:device][:token].scan(/\<(.+)\>/).first) || APN::Device.new
    @device.attributes = params[:device]
    @device.last_registered_at = Time.now
    if @device.save
      render :xml => @device.to_xml(:only => [:id])
    else
      render :xml => @device.errors
    end
  end
end
