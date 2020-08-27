class AddMerchantToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :merchant_id, :integer
  end
end
