class CreateStatusUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :status_updates do |t|
      t.integer :status
      t.integer :order_id, index: true
      t.timestamps
    end
  end
end
