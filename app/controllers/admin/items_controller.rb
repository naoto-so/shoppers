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

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.admin?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
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
