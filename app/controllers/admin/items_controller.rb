class Admin::ItemsController < ApplicationController
  # before_action :if_not_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private
  def if_not_admin
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
