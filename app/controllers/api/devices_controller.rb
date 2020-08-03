class Api::DevicesController < ApiController
  include HTTParty
  def index
    render :json => Device.all
  end

  def send_measurement
    if self.class.post(BODYTRACE_CONFIG['measurements_link'], options)
      render status :ok
    else
      render status :forbidden
    end
  end

  def options
    {
      :body => params.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
  end
end