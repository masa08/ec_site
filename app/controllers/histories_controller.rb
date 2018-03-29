class HistoriesController < ApplicationController

  def show
  	@history = History.find(params[:id])
  end

  def new
  	@user = current_user
  	@history = History.new
  end

  def comfirmation
  	@user = current_user
  	@history = History.new(history_params)
  	@cart = Cart.find_by(user_id: current_user)
<<<<<<< Updated upstream
=======
  	@item_carts = ItemCart.where(cart_id: @cart)


 	sum = 0
  	@item_carts.each do |item_cart|
  		sub_total = item_cart.item.price.to_i * item_cart.item_count.to_i
  		sum+=sub_total
  	end
  	@history.total_price = sum


>>>>>>> Stashed changes
  end

  def create
  	@history = History.new(history_params)
  	 # get cart.id
    @cart = Cart.find_by(user_id: current_user)
    # get items in cart
    @cart_items = @cart.item_carts

    if @history.save

    @cart_items.each do |cart_item|
      @count = cart_item.item_count
      @item = Item.find_by(id: cart_item.item_id)

      	  @purchase = Purchase.new(item_id: cart_item.item_id, history_id: @history.id)
          @purchase.save

      @item_count = @item.stock
      @item_count -= @count
      @item.update(stock: @item_count)
      cart_item.destroy
		
	end
		redirect_to complete_view_path	
		else
			binding.pry
			@user = current_user
			render :action => "new", id: @user.id 
		end
  end

	private
	def history_params
<<<<<<< Updated upstream
		params.require(:history).permit(:user_id, :payment_id, :delivery_id, :send_address, :send_postal_code, :send_name_kanji, :send_name_kana)
=======
		params.require(:history).permit(:user_id, :payment_id, :delivery_id, :send_address, :send_postal_code, :send_name_kanji, :send_name_kana, :status_id, :total_price)
>>>>>>> Stashed changes
	end

end
