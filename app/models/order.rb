class Order < ApplicationRecord
  include HTTParty
  has_one :device, :dependent => :destroy
  has_one :shipment, :dependent => :destroy
  has_many :status_updates, :dependent => :destroy

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}

  after_create :create_order_and_shipment
  after_save :create_status_update
  after_update :update_shipment_status

  def create_order_and_shipment
    device = self.create_device(:imei => Faker::Code.imei, :uuid => Faker::Internet.uuid, :device_type => device_type)
    shipment = self.create_shipment(:tracking_number => Faker::Alphanumeric.alphanumeric(number: 18).upcase)
    self.update_attributes(device: device, shipment: shipment)
  end

  def create_status_update
    status_updates.create(:status => self.status, :order_id =>  self.id)
  end

  def order_update_url
    vendor.nil?? BODYTRACE_CONFIG['orders_link'] : "#{BODYTRACE_CONFIG['orders_link']}/#{vendor}"
  end

  def update_shipment_status
    self.shipment.update_attributes(:status => self.status)
    if self.fulfilled?
      self.device.update_attributes(:status => "shipping")
    elsif self.delivered?
      self.device.update_attributes(:status => "ready")
    end
    self.class.post(order_update_url, options)
  end

  def options
    {
      :body => response_for_api.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
  end

  def shipping_address_for_api
    {:street => street, :city => city, :state => state, :postalCode => postal_code, :country => country}
  end

  def status_for_api
    if pending?
      "Processing"
    elsif fulfilled?
      "Fulfilled"
    else
      "Delivered"
    end
  end

  def device_type
    if Kits::BP_CUFF_IDS.include?(kit_id)
      "bp_cuff"
    elsif Kits::SCALE_IDS.include?(kit_id)
      "scale"
    else
      "unknown"
    end
  end

  def response_for_api
    {
      id: uuid,
      status: status_for_api,
      statusUpdates: status_updates.map{|update| {status: update.status_for_api, ts: update.created_at.to_time.to_i}},
      reference: reference,
      organizationId: organization_id,
      quantity: quantity.to_i,
      kitId: kit_id,
      items: Device.where(order_id: id).map{|device| {productId: device.uuid, vendorProductId: "BT003G", quantity: quantity.to_i, subscriptionId: "c5a6ddd2-b44e-11e3-b5ae-bc764e04e32e"}},
      shippingAddress: shipping_address_for_api,
      billingAddress: shipping_address_for_api,
      phoneNumber: phone_number,
      email: email,
      carrierService: {:carrierName => "USPS", :serviceName => "Standard"},
      shipments: {shipment.tracking_number.to_sym => {:status => status_for_api, :uniqueItems => {device.imei.to_s.to_sym => uuid}}},
      tracking: [shipment.tracking_number],
      uniqueItems: {device.imei.to_sym => uuid},
      order: {id: uuid, quantity: quantity}
    }
  end
end
