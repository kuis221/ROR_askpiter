class ProductsController < ApplicationController
  include HelperAttr
  helper_attr :product, :pictures, :reviews, :photos, :videos, :similars
  before_action :set_product, only:[:show]
  respond_to :json, only: [:index]

  def index
    @products = Product
    @products = @products.joins(:sub_category).where('sub_categories.category_id = ?', params[:category_id]) if params[:category_id].present?
    @products = @products.where(company_id: params[:company_id]) if params[:company_id].present?
    respond_with @products
  end

  def show
    @pictures = product.pictures.recent.first(6)
    @reviews = product.reviews.recent.first(3)
    @photos = product.photos.recent.first(5)
    @videos = product.videos.recent.first(5)
    @similars = Kaminari.paginate_array(product.similars.recent)
                     .page(params[:page])
                     .per(10)
    if request.xhr?
      render partial: 'product_xhr', locals: { results: @similars }
    else
      render
    end
  end

    def set_filter_options
      @product = Product.find(params[:product_id]) if params[:product_id].present?

      sub_category = SubCategory.find(params[:id])
      @filter_options = sub_category.filter_options

      respond_to do |format|
         format.html { render :layout => false }
         format.js {}
      end
    end

  private

  def set_product
    @product = Product.find params[:id]
  end
end
