class Admin::ItemsController < ApplicationController
  before_action :if_not_admin

  def index
  end

  def new
    @item = Item.new
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
