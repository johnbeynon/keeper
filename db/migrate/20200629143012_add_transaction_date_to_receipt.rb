class AddTransactionDateToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :transaction_date, :date
  end
end
