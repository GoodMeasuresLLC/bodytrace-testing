class Order < ApplicationRecord
  include HTTParty
  has_one :device, :dependent => :destroy, autosave: true
  has_one :shipment, :dependent => :destroy, autosave: true
  has_many :status_updates, :dependent => :destroy, autosave: true

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}

  before_save :build_status_update
  before_update :update_shipment_status
  after_update :post_update

  def ship_device
  end

  def build_status_update
    status_updates.build(:status => self.status, :order_id =>  self.id)
  end

  def order_update_url
    vendor.nil?? BODYTRACE_CONFIG['orders_link'] : "#{BODYTRACE_CONFIG['orders_link']}/#{vendor}"
  end

  def update_shipment_status
    if self.fulfilled?
      self.build_device(status: :shipping, :imei => Faker::Code.imei, :uuid => Faker::Internet.uuid, :device_type => device_type)
      self.build_shipment(status: status, :tracking_number => Faker::Alphanumeric.alphanumeric(number: 18).upcase)
    elsif self.delivered?
      self.shipment.status = status
      self.device.status = :ready
    end
  end

  def post_update
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
    elsif Kits::SLEEP_MAT_IDS.include?(kit_id)
      "sleep_mat"
    else
      "unknown"
    end
  end

  def response_for_api
    response = {
      id: uuid,
      status: status_for_api,
      statusUpdates: status_updates.map{|update| {status: update.status_for_api, ts: update.created_at.to_time.to_i}},
      reference: reference,
      organizationId: organization_id,
      quantity: quantity.to_i,
      kitId: kit_id,
      shippingAddress: shipping_address_for_api,
      billingAddress: shipping_address_for_api,
      phoneNumber: phone_number,
      email: email,
      carrierService: {:carrierName => "USPS", :serviceName => "Standard"},
      order: {id: uuid, quantity: quantity}
    }
    if(device)
      response.merge!(
        items: [{productId: device.uuid, vendorProductId: "BT003G", quantity: quantity.to_i, subscriptionId: "c5a6ddd2-b44e-11e3-b5ae-bc764e04e32e"}],
        uniqueItems: {device.imei.to_sym => uuid},
        shipments: {shipment.tracking_number.to_sym => {:status => status_for_api, :uniqueItems => {device.imei.to_s.to_sym => device.imei.to_s.to_sym}}},
        tracking: [shipment.tracking_number],
      )
    end
    response
  end
end
