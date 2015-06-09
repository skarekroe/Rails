class ApplicationController < ActionController::Base
  include ArticlesHelper
  protect_from_forgery with: :exception

	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Created Article: '#{@article.title}'!"

		redirect_to article_path(@article)	
	end

	def destroy
		@article = Article.find(params[:id]).destroy

		flash.notice = "Deleted Article '#{@article.title}'!"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end

end
