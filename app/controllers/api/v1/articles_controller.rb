class Api::V1::ArticlesController < ApplicationController
	before_action :set_article,only:[:show,:destroy]
	def index
		render json: Article.all
	end

	def show
		render json: @article
	end

	def create
		@article = Article.create(article_params)
		if @article.save
			render json: @article, status: 201
		else
			render json: {errors: @article.errors.full_messages},status: 422
		end
	end

	def destroy
		@article.destroy
		render :show,status: :ok
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.permit(:title,:body)
	end
end
