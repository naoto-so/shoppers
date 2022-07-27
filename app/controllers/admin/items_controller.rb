class Admin::ItemsController < ApplicationController
  before_action :if_not_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def if_not_admin
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end

  def item_params
    params.require(:item).permit(:item, :explain, :price, :image)
  end

end
