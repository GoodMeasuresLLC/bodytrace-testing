class Api::DevicesController < ApplicationController
  def index
    render :json => @devices
  end
end