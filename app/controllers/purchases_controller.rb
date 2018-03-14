class PurchasesController < ApplicationController
  def confimation
  end

  def complete
    # get cart.id
    @cart = Cart.find_by(params[:cart_id])
    # get items in cart
    @cart_items = @cart.item_carts
    @cart_items.each do |cart_item|
      @count = cart_item.item_count
      @item = Item.find_by(id: cart_item.item_id)
      @item_count = @item.stock
      @item_count -= @count
      @item.update(stock: @item_count)
      cart_item.destroy
    end
    redirect_to complete_view_path
  end

  def complete_view

  end
end
