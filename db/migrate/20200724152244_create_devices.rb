class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :imei
      t.integer :status, default: 0
      t.integer :order_id, :index => true

      t.timestamps
    end
  end
end
