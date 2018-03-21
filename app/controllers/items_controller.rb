class ItemsController < ApplicationController
  def index
    # 小野瀬サイドバー検証中
    if params["type.id"].present?
      @items = Item.where("types.id" => params["type.id"])
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
