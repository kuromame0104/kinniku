class CategoriesController < ApplicationController
  def show
    # @categories = Category.all
    @category = Category.find(params[:id])
    # binding.pry
    @messages = @category.messages.includes(:user)
    # @messages = Category.where(category_id: params[:id])
  end
end
