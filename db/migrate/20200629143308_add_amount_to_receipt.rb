class AddAmountToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :amount, :decimal
  end
end
