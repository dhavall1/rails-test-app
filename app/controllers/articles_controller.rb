
class ArticlesController < ApplicationController
  
  before_action :set_article_param, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  
  def new
    
    @article = Article.new
    
  end
  
  def show
  
        #@article = Article.find(params[:id])
    
  end
  
  def destroy
    
   #@article = Article.find(params[:id])
   @article.destroy
   flash[:success] = "Article was successfully deleted"
   
  redirect_to articles_path
  end
  
  
  #DDL create edit action
  def edit
   # @article = Article.find(params[:id])
  end
  
  
  #update action handles the submit from edit
  def update
   # @article = Article.find(params[:id])
    
    #the update needs whitelisted params
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to article_path(@article)
      else
      render 'edit'
    end
    
  end
  
  
  
  def create
    
    #render plain: params[:article].inspect
    
    @article = Article.new (article_params)
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    
    end
    #DDL - to show the created articles
    
    #DDL - the articles_path is name decided from the route names (checked using rake routes)
    
  
    
  end
  
  private 
  
  def set_article_param
    
  @article = Article.find(params[:id])
    
  end
  
  #this is a method to be called instead of duplicating the code everywhere
  def article_params
  
    params.require(:article).permit(:title, :description)
  
  end

  
end
