class AddColumnToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :ship_date, :date, null: true
  end
end
