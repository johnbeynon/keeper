class AddTrayIdToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :tray_id, :integer
  end
end
