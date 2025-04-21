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


  # Prepare the form for creating a new category
  def new
    @category = Category.new
  end

  # Create a new category and save it to the database
  def create 
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new, alert: 'There was an issue creating the category.'
    end
  end

  private

  # Strong parameters to allow only the name attribute for category creation
  def category_params
    params.require(:category).permit(:name)
  end
end

