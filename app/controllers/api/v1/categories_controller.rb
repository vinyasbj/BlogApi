class Api::V1::CategoriesController < ApplicationController
  before_action :set_api_v1_category, only: [:show, :update, :destroy]
  def index
    @categories = Api::V1::Category.all

    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    @category = Api::V1::Category.new(api_v1_category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(api_v1_category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private
    def set_api_v1_category
      @category = Api::V1::Category.find(params[:id])
    end

    def api_v1_category_params
      params.require(:api_v1_category).permit(:string)
    end
end
