object @order => :order
attributes :status, :reference, :organization_id, :quantity, :kit_id, :phone_number, :email
attributes :uuid => :id

child :status_updates do
  attributes :status
  node (:ts) do |update|
    update.created_at.to_time.to_i
  end
end

node (:shipping_address) do |order|
  order.shipping_address_for_api
end

node (:billing_address) do |order|
  order.shipping_address_for_api
end

node (:carrier_service) do
  { :carrier_name => "USPS", :service_name => "Standard" }
end

node (:shipments) do |order|
  { 
    order.shipment.tracking_number.to_sym => {
      status: order.shipment.status
    }
  }
end

node (:tracking) do |order|
  order.shipment.tracking_number
end

child @order => :order do
  attributes :quantity
  attributes :uuid => :id
end