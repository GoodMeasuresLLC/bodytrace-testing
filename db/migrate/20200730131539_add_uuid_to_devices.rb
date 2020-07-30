class AddUuidToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :uuid, :string
  end
end
