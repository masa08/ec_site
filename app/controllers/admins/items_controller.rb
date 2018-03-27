class Admins::ItemsController < ApplicationController
    before_action :authenticate_admin!


	def index
    @items = Item.all
    @item = Item.new
  end
	
  def show
    @item = Item.find(params[:id])

  end
  def new
    @item = Item.new
    @item.item_genres.build
    @item.tunes.build
  end
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admins_items_path
  end
  def edit
    @item = Item.find(params[:id])
    @item.item_genres.build
    @item.tunes.build
  end
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admins_item_path(item.id)
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
  end
  private
  def item_params
    params.require(:item).permit(:item_name, 
                                 :stock, 
                                 :artist_name,
                                 :jacket_image, 
                                 :price, 
                                 :label, 
                                 :release_date_id, 
                                 :type_id,
                                 item_genres_attributes: [:id,:item_id,:genre_id],
                                 tunes_attributes: [:id, :item_id, :tune_title, :_destroy]
                                 )
  end

end
