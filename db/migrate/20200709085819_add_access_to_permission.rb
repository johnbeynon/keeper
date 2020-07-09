class AddAccessToPermission < ActiveRecord::Migration[6.0]
  def change
    add_column :permissions, :access, :string, default: 'read'
  end
end
