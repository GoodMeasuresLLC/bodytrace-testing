class Device < ApplicationRecord
  belongs_to :order, :inverse_of => :device

  enum :status => {:pending => 0, :shipping => 1, :ready => 2}
  enum :device_type => {:scale => 0, :bp_cuff => 1}
end