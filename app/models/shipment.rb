class Shipment < ApplicationRecord
  belongs_to :order, :inverse_of => :shipment

  enum :status => {:pending => 0, :shipping => 1, :fulfilled => 2}
end