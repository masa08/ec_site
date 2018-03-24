class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @item_carts = ItemCart.where(cart_id: @cart)

  end

  def add_item
    # get item.id
    @item_id = params[:item_id]
    # get_item
    @item = Item.find_by(id: @item_id)
    # get user
    @user = User.find(current_user.id)
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

    # save user.cart_id
    @user.cart_id = @cart_id
    @user.save
  
    # Create ItemCart or Update item_cart
    if ItemCart.where(cart_id: @cart_id, item_id: @item_id).presence
      @item_cart = ItemCart.find_by(cart_id: @cart_id, item_id: @item_id)
      if @item.stock > @item_cart.item_count
        @item_cart.item_count += 1
        @item_cart.update(item_count: @item_cart.item_count)
      else
        # 購入数が元々ある数を超えた場合は追加しない。
        return
      end
    else
      @item_cart = ItemCart.new(item_id: @item_id, cart_id: @cart_id, item_count: 1)
      @item_cart.save
    end

    redirect_to cart_path(@cart_id)
  end
  def more_items

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
