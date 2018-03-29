class ItemsController < ApplicationController
  def index
      @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def sidebar_index
     @items = [] #初期値を配列で設定
     if params[:genre_id].present?

      item_genres = ItemGenre.where(genre_id: params[:genre_id])


      item_genres.each do |item_genre|

      item = Item.find(item_genre.item_id) #findメソッドはidを参照するため直接打ち込んでオッケー
      @items << item #データの追加は演算子<<で
    end
    elsif params[:type_id].present?
      @items = Item.where(type_id: params[:type_id])
    else
      @items = Item.all 
   end
end

  def update

  end

  def destroy

  end


end
