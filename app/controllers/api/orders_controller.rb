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

    render :json => {
      id: @order.uuid,
      status: @order.status,
      statusUpdates: @order.status_updates,
      reference: @order.reference,
      organizationId: @order.organization_id,
      quantity: @order.quantity.to_i,
      kitId: @order.kit_id,
      shippingAddress: @order.shipping_address_for_api,
      billingAddress: @order.shipping_address_for_api,
      phoneNumber: @order.phone_number,
      email: @order.email,
      carrierService: {:carrierName => "USPS", :serviceName => "Standard"},
      shipments: {@order.shipment.tracking_number.to_sym => @order.shipment.status, :uniqueItems => {@order.device.id.to_s.to_sym => @order.uuid}},
      tracking: @order.shipment.tracking_number,
      uniqueItems: {@order.device.id.to_s.to_sym => @order.uuid},
      order: {id: @order.uuid, quantity: @order.quantity}
    }
  end

  def update
    Order.find(params[:id]).update_attributes(order_update_params)
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