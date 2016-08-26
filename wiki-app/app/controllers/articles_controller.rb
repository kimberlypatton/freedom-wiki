class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @article = @group.articles.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article), notice: 'Article was created successfully.'
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    group = article.group
    article.destroy
    redirect_to group_path(group), notice: 'Article was deleted successfully.'
  end

   def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article), notice: "The article has been updated successfully."
    else
      render action: "edit"
    end
  end


  private
  def article_params
    params.require(:article).permit(:name, :content)
  end

end
