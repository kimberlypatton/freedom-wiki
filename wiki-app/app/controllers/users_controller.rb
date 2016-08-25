class UsersController < ApplicationController

  def show

     @users_groups = current_user.groups
     @group_articles = []
     @users_groups.each do |group|
        group.articles.each do |article|
          @group_articles << article
        end
     end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :role)
    end
end
