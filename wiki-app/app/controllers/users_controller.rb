class UsersController < ApplicationController

  def show
    @user = User.find(current_user)
    @featured_articles = @user.groups.articles
  end

end
