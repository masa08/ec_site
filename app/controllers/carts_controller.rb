class CartsController < ApplicationController
  def show

  end
  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    @item = params[:item_id]
    binding.pry


  end

# カート詳細画面から、「更新」を押した時のアクション
  def update_item

  end
# カート詳細画面から、「削除」を押した時のアクション
  def delete_item

  end

end
