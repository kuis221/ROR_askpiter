class ProductsController < ApplicationController
  include HelperAttr
  helper_attr :product, :pictures, :reviews, :photos, :videos, :similars
  before_action :set_product, only:[:show]

  def show
    @pictures = product.pictures.recent.first(6)
    @reviews = product.reviews.recent.first(3)
    @photos = product.photos.recent.first(5)
    @videos = product.videos.recent.first(5)
    @similars = product.similars.recent.first(10)
  end

  private

  def set_product
    @product = Product.find params[:id]
  end
end
