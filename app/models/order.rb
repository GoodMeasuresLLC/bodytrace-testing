class Order < ApplicationRecord
  has_one :device, :dependent => :destroy
  has_one :shipment, :dependent => :destroy
  has_many :status_updates, :dependent => :destroy

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}

  after_create :create_order_and_shipment
  after_save :create_status_update
  after_update :update_shipment_status

  def create_order_and_shipment
    self.create_device(:imei => Faker::Code.imei)
    self.create_shipment(:tracking_number => Faker::Alphanumeric.alphanumeric(number: 18).upcase)
  end

  def create_status_update
    status_updates.create(:status => self.status, :order_id =>  self.id)
  end

  def update_shipment_status
    self.shipment.update_attributes(:status => self.status)
    if self.fulfilled?
      self.device.update_attributes(:status => "shipping")
    elsif self.delivered?
      self.device.update_attributes(:status => "ready")
    end
  end

  def shipping_address_for_api
    {:street => street, :city => city, :state => state, :postalCode => postal_code, :country => country}
  end
end