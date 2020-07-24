class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.integer :quantity, :default => 1
      t.integer :status, :default => 0
      t.string :kit_id
      t.string :organization_id
      t.string :reference
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone_number
      t.string :email
      t.string :shipping_address
      t.string :imei
    end
  end
end
