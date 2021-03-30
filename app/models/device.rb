class Device < ApplicationRecord
  belongs_to :order, :inverse_of => :device

  enum :status => {:pending => 0, :shipping => 1, :ready => 2}
  enum :device_type => {:unknown => 0, :scale => 1, :bp_cuff => 2, sleep_mat: 3}
end
