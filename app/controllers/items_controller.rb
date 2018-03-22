class ItemsController < ApplicationController
  def index
    # 小野瀬サイドバー検証中
     if params[:types_id].present?
      @items = Item.where(params[:types_id])
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  def update

  end

  def destroy

  end


end
