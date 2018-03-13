class CartsController < ApplicationController
  def show
    @item_carts = ItemCart.all
  end

  def add_item
    # get item.id
    @item = params[:item_id]
    # Create Cart or Find Cart
    if Cart.where(user_id: current_user.id).presence
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
    end
    # get cart_id
    @cart_id = @cart.id
    # get all ids to save item_cart

    # Create ItemCart or Update item_cart
    if ItemCart.where(cart_id: @cart_id, item_id: @item).presence
      @item_cart = ItemCart.find_by(cart_id: @cart_id, item_id: @item)
      @item_cart.item_count += 1
      @item_cart.update(item_count: @item_cart.item_count)
    else
      @item_cart = ItemCart.new(item_id: @item, cart_id: @cart_id, item_count: 1)
      @item_cart.save
    end

    redirect_to cart_path(@cart_id)
  end

  def update_item

  end
  def delete_item
    # item_cart update
    @item_cart = ItemCart.find(params[:id])
    @item_cart.item_count -= 1
    @item_cart.update(item_count: @item_cart.item_count)
    # delete item_cart
    if @item_cart.item_count == 0
      @item_cart.destroy
    end
    redirect_to cart_path(@item_cart.cart_id)
  end
end
