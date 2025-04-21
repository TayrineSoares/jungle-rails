class Admin::CategoriesController < ApplicationController
  # Display all categories
  def index
    @categories = Category.all
  end

  # Display a specific category and its products
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
end