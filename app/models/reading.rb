class Reading < ApplicationRecord
  belongs_to :device, :inverse_of => :readings
end