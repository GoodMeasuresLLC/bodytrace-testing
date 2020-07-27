class Device < ApplicationRecord
  has_many :readings, :through => :device_readings, :dependent => :destroy

  enum :status => {:pending => 0, :shipping => 1, :ready => 2}
end