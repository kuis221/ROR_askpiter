class SearchController < ApplicationController

  def index
    @filters = SearchFilter.build params
    @categories = Category.includes(:sub_categories).all
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @products = Product.search(params[:search], params[:category_id], params[:sub_category_id], params[:company_id]) 
    current_user.remove_search( params[:delete_search] ) if params[:delete_search]
    current_user.save_search(params[:search]) if user_signed_in? and params[:search]
  end
  
end
