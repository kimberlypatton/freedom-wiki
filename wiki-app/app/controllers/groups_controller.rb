class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.categories << Category.find_by(name: "General")

    if @group.save
      Membership.create(user: current_user, group: @group, role: "admin")
      redirect_to group_path(@group), notice: 'Group was created successfully.'
    else
      render :new
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_url, notice: 'Group was deleted successfully.'
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

end
