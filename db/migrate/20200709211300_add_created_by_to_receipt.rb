class AddCreatedByToReceipt < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :created_by, :integer
  end
end
