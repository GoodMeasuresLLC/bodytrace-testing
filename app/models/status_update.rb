class StatusUpdate < ApplicationRecord
  belongs_to :order

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}
end