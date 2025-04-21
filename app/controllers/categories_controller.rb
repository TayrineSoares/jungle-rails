
class CategoriesController < ApplicationController

  def show
    # Find the category by the ID passed in the URL
    @category = Category.find(params[:id])

    # Get all the products associated with this category, ordered by creation date
    @products = @category.products.order(created_at: :desc)
  end

end
