class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
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
      t.string :shipping_address
      t.string :uuid

      t.timestamps
    end
  end
end
