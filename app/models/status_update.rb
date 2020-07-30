class StatusUpdate < ApplicationRecord
  belongs_to :order

  enum :status => {:pending => 0, :fulfilled => 1, :delivered => 2}

  def status_for_api
    if pending?
      "Pending"
    elsif fulfilled?
      "Fulfilled"
    else
      "Delivered"
    end
  end
end