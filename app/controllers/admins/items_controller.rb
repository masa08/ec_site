class Admins::ItemsController < ApplicationController
	before_action :ransack, only: [:index, :show, :new, :edit]


	def index
    @items = Item.all
    @item = Item.new
    # ransack
    @search = Item.ransack(params[:q])  #追加
    @results = @search.result
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
  def edit

  end
  def update

  end
  def destroy

  end
  private
  def item_params
    params.require(:item).permit(:item_name, :stock, :artist_name,
      :jacket_image, :price, :label, :item_status_id, :release_date_id)
  end
	def ransack
    # ransack
    @search = Item.ransack(params[:q])  #追加
    @results = @search.result
  end

end
