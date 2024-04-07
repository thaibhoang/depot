class CombineItemsInCart < ActiveRecord::Migration[7.1]
  def up
    Cart.all.each do |cart|
      items_total_quantity = cart.line_items.group(:product_id).sum(:quantity)
      items_total_quantity.each do |product_id, quantity|
        if quantity > 1
          # remove all item
          cart.line_items.where(product_id: product_id).delete_all

          # replace with a new rebuilt item
          rebuilt_item = cart.line_items.build(product_id: product_id)
          rebuilt_item.quantity = quantity
          rebuilt_item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quantity > ?", 1).each do |line_item|
      line_item.quantity.times do 
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end
      line_item.destroy
    end
  end
end
