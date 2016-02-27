class SubCategoriesController < ApplicationController
  def show
    @sub_category = SubCategory.find(params[:id])
    @products = @sub_category.products.filter(params[:filters])
    @filters = @sub_category.filters
  end
end
