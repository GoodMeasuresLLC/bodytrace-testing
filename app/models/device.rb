class Device < ApplicationRecord
  has_many :readings, :through => :device_readings, :dependent => :destroy
end