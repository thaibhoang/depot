class AddColumnsToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :routing_number, :string, null: true
    add_column :orders, :account_number, :string, null: true
    add_column :orders, :credit_card_number, :string, null: true
    add_column :orders, :expiration_date, :string, null: true
    add_column :orders, :po_number, :integer, null: true
  end
end
