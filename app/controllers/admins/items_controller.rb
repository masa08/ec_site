class Admins::ItemsController < ApplicationController


	def index
    @items = Item.all
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
    redirect_to admins_items_path
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    item = Item.find(item_params)
    item.update(params[:id])
    redirect_to admins_items_path
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
  end
  private
  def item_params
    params.require(:item).permit(:item_name, :stock, :artist_name,
      :jacket_image, :price, :label, :release_date_id, item_genres_attributes: [:genre_id])
  end

end
