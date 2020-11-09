class AddDefaultToTrays < ActiveRecord::Migration[6.0]
  def change
    add_column :trays, :default, :boolean, default: false

  end
end
