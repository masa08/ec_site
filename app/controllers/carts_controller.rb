class CartsController < ApplicationController
  def show
    @item_carts = ItemCart.all
  end
  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    @item = params[:item_id]
    # Create Cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      @cart.user_id = current_user.id
      session[:cart_id] = @cart.id
      @cart.save
    end
    # take cart_id
    @cart_id = @cart.id
    @item_cart = ItemCart.new(item_id: @item, cart_id: @cart_id)
    @item_cart.save
    redirect_to cart_path(@cart_id)
  end

# カート詳細画面から、「更新」を押した時のアクション
  def update_item

  end
# カート詳細画面から、「削除」を押した時のアクション
  def delete_item

  end

end
