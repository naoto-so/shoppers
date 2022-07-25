class Admin::ItemsController < ApplicationController
  before_action :if_not_admin

  def index
  end

  def new
  end

  private
  def if_not_admin
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
