class UpdateLineItemPrice < ActiveRecord::Migration[7.1]
  def up
    LineItem.all.each do |item| 
      if item.price.nil?
        item.price = item.product.price
        item.save
      end
    end
  end
end
