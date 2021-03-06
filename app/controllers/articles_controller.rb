class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      flash[:notice] = "Article has been created."
      redirect_to articles_path(@article)
    else
      flash.now[:error] = "Article could not be created."
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article has been updated."
      redirect_to articles_path(@article)
    else
      flash.now[:error] = "Article could not be updated."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy 
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :author_id, tag_ids: [])
    end

end
