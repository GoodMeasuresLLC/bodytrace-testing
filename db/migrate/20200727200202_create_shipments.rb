class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :tracking_number
      t.integer :status, default: 0
      t.integer :order_id, :index => true

      t.timestamps
    end
  end
end
