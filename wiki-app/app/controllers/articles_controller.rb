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
      @category = Category.where(id: params[:category])
      @article.categories.push(@category)
      redirect_to article_path(@article), notice: 'Article was created successfully.'
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_url, notice: 'Article was deleted successfully.'
  end

   def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "The article has been updated successfully."
    else
      render action: "edit"
    end
  end


  private
  def article_params
    params.require(:article).permit(:name, :content)
  end

end
