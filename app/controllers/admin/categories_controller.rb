module Admin
  class CategoriesController < ApplicationController
    before_action :authenticate

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: 'Category created successfully.'
      else
        render :new
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end

    def authenticate
      # Add your authentication logic here (e.g., ensure the user is an admin)
    end
  end
end