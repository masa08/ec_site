class ItemsController < ApplicationController
  def index
    # 小野瀬サイドバー検証中
    if params[:types_id].present?
      # binding.pry
      @items = Item.where(types_id: params[:types_id])
    else
      @items = Item.all
    end
    
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to item_path(item.id)
  end

  def update

  end

  def destroy

  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :stock, :artist_name,
      :jacket_image, :price, :label, :item_status_id, :release_date_id, :types_id)
  end

end
