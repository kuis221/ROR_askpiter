class ProductsController < ApplicationController
  include HelperAttr
  helper_attr :product, :pictures, :reviews, :photos, :videos, :similars

  def show
    set_product
    self.pictures = product.pictures.recent.first(6)
    self.reviews = product.reviews.recent.first(3)
    self.photos = product.photos.recent.first(5)
    self.videos = product.videos.recent.first(5)
    self.similars = product.similars.recent.first(10)
  end

  private

  def set_product
    self.product = Product.find params[:id]
  end
end
