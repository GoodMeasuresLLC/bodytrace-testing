class Api::DevicesController < ApiController
  include HTTParty
  def index
    render :json => Device.order(created_at: :desc)
  end

  def send_measurement
    self.class.post(BODYTRACE_CONFIG['measurements_link'], options)
  end

  def queue_measurement
    self.class.post(BODYTRACE_CONFIG['kinesis-queue-blerg'], options)
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
