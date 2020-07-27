class Api::DevicesController < ApiController
  def index
    render :json => Device.all
  end
end