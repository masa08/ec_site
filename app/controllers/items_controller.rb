class ItemsController < ApplicationController
  def index
      @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def sidebar_index
     # 小野瀬サイドバー検証中
     if params[:genre_id].present?
      @item_genres = ItemGenre.where(genre_id: params[:genre_id])
      binding.pry
      @items = Item.where(item_genres)
    elsif params[:type_id].present?
      @items = Item.where(type_id: params[:type_id])
    else
      @items = Item.all 
    end
    # binding.pry
  end

  def update

  end

  def destroy

  end


end
