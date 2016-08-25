class MembershipController < ActionController::Base

  def create
    Membership.create(user: current_user, group_id: params[:group_id], role: "pending" )
    redirect_to groups_path
  end

end
