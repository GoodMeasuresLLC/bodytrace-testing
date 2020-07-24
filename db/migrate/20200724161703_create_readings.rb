class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.integer :battery_voltage
      t.integer :signal_strength
      t.integer :rssi
      t.integer :unit
      t.integer :tare
      t.integer :weight
    end
  end
end
