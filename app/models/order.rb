class Order < ApplicationRecord
  has_one :device, :dependent => :destroy
  has_one :shipment, :dependent => :destroy
  has_many :status_updates, :dependent => :destroy

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}

  after_create :create_order_and_shipment
  after_save :create_status_update

  def create_order_and_shipment
    self.create_device(:imei => Faker::Code.imei)
    self.create_shipment(:tracking_number => Faker::Alphanumeric.alphanumeric(number: 18).upcase)
    status_updates.create(:status => 0, :order_id =>  self.id)
  end

  def create_status_update
    status_updates.create(:status => self.status, :order_id =>  self.id)
  end

  def shipping_address_for_api
    {:street => street, :city => city, :state => state, :postalCode => postal_code, :country => country}
  end
end