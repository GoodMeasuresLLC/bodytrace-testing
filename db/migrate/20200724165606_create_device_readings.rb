class CreateDeviceReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :device_readings do |t|
      t.belongs_to :device, null: false
      t.belongs_to :reading, null: false
    end
  end
end
