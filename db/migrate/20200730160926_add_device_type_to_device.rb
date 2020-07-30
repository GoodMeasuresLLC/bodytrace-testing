class AddDeviceTypeToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :device_type, :integer, default: 0
  end
end
