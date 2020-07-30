class Api::OrdersController < ApiController
  require "faker"

  def index
    render :json => Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.assign_attributes(address_params)
    @order.assign_attributes(:uuid => Faker::Internet.uuid)

    @order.save

    render :json => @order.response_for_api
  end

  def update
    @order = Order.find(params[:id]).update_attributes(order_update_params)

    render :json => Order.all
  end

  private

  def order_params
    params.except(:order, :shippingAddress).transform_keys!(&:underscore).permit(:quantity, :kit_id, :organization_id, :reference, :first_name, :last_name, :company_name, :phone_number, :email)
  end

  def address_params
    params.require(:shippingAddress).transform_keys!(&:underscore).permit(:street, :city, :state, :postal_code, :country)
  end

  def order_update_params
    params.require(:order).permit(:status)
  end
end