class SearchController < ApplicationController

  def index
    @filters = SearchFilter.build params
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @search_results = ProductSearchService.new( params ).search
    current_user.remove_search( params[:delete_search] ) if params[:delete_search]
    current_user.save_search(params[:search]) if user_signed_in? and params[:search]

    if request.xhr?
      render partial: 'search_results', locals: { results: @search_results }
    else
      @categories = Category.includes(:sub_categories).all
      render
    end
  end

end
