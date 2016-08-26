class AdminController < ApplicationController
  before_action :require_admin

  def panel
    @group = Group.find(params[:group_id])
    @memberships = @group.memberships.where.not(role: 'admin').order(role: :desc)
  end

  private
  def require_admin
    unless Group.find(params[:group_id]).admin == current_user
      redirect_back fallback_location: login_path
    end
  end
end
