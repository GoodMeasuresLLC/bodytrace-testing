class Shipment < ApplicationRecord
  belongs_to :order, :inverse_of => :shipment

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}
end