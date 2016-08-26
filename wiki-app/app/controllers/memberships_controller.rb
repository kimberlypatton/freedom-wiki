class MembershipsController < ApplicationController

  def create
    if current_user
      Membership.create(user: current_user, group_id: params[:group_id], role: "pending" )
    end
    redirect_to group_path(params[:group_id])
  end

  def update
    membership = Membership.find(params[:id])
    membership.update(role: "member")
    redirect_back fallback_location: group_admin_path(membership.group_id)
  end

  def destroy
    membership = Membership.find_by_id(params[:id])
    membership.destroy
    redirect_back fallback_location: group_admin_path(membership.group_id)
  end
end
