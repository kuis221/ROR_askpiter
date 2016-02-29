class SubCategoriesController < ApplicationController
  def show
    @sub_category = SubCategory.find(params[:id])
    @products = @sub_category.products.filter(params[:filters])
    @filters = @sub_category.filters

    respond_to do |format|
      format.js { render 'success', layout: false }
      format.html
    end
  end
end
