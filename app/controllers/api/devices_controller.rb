class Api::DevicesController < ApiController
  include HTTParty
  def index
    render :json => Device.all
  end

  def send_measurement
    self.class.post(BODYTRACE_CONFIG['measurements_link'], options)
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