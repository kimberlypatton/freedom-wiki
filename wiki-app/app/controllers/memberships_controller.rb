class MembershipsController < ApplicationController

  def create
    if current_user
      Membership.create(user: current_user, group_id: params[:group_id], role: "pending" )
    end
    redirect_to groups_path
  end
end
