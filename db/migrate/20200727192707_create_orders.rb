class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :vendor
      t.string :quantity, :default => 1
      t.integer :status, :default => 0
      t.string :kit_id
      t.string :organization_id
      t.string :reference
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone_number
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :uuid
      t.integer :device_id, :index => true
      t.integer :shipment_id, :index => true

      t.timestamps
    end
  end
end
