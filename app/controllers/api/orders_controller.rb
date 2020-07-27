class Api::OrdersController < ApiController
  def index
    render :json => Order.all
  end

  def create

  end
end