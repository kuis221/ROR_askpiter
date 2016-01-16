class SearchController < ApplicationController

  def index
    @filters = SearchFilter.build params
    @category = SubCategory.find_by_id(params[:category_id]) if params[:category_id]
    @products = Product.search(params[:search], params[:category_id]) 
    current_user.save_search(params[:search]) if user_signed_in? and params[:search]
  end
  
  def update_params( params, action, key, value )
    params.remove(:controller)
    params.remove(:action)
    params.remove(key) if action == :remove
    params[key] = value if action == :update
    params
  end

end
