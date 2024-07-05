# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
