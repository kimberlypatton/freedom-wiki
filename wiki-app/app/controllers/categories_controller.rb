class CategoriesController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @group = Group.find(params[:group_id])
    @category_articles = @category.articles.where(group_id: @group)
  end

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @category = @group.categories.find_or_create_by(category_params)
    if @category.save
      redirect_to category_path(@category), notice: 'Category was created successfully.'
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_url, notice: 'Category was deleted successfully.'
  end

   def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path, notice: "The category has been updated successfully."
    else
      render action: "edit"
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless Group.find(params[:group_id]).admin == current_user
      redirect_back fallback_location: login_path
    end
  end
end
