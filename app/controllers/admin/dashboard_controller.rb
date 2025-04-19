class Admin::DashboardController < ApplicationController
   # Basic Authentication using environment variables
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]


  def show
    # Fetch the count of products and categories
    @product_count = Product.count
    @category_count = Category.count
  end
end
