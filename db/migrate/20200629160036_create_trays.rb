class CreateTrays < ActiveRecord::Migration[6.0]
  def change
    create_table :trays do |t|
      t.string :name
      t.timestamps
    end
  end
end
