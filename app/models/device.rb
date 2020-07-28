class Device < ApplicationRecord
  belongs_to :order, :inverse_of => :device

  enum :status => {:pending => 0, :shipping => 1, :ready => 2}
end