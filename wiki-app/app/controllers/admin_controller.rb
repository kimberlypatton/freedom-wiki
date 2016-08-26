class AdminController < ApplicationController
  before_action :require_admin

  def panel
    @group = Group.find(params[:group_id])
  end

  private
  def require_admin
    unless Group.find(params[:group_id]).admin == current_user
      redirect_back fallback_location: login_path
    end
  end
end
