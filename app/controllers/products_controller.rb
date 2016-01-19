class ProductsController < ApplicationController
  include HelperAttr
  helper_attr :product, :pictures, :picture, :reviews, :photos, :videos

  def show
    set_product
    self.pictures = product.pictures.recent.first(6)
    self.picture = pictures.first || product.default_picture
    self.reviews = product.reviews.recent.first(3)
    self.photos = product.photos.recent.first(5)
    self.videos = product.videos.recent.first(5)
  end

  private

  def set_product
    self.product = Product.find params[:id]
  end
end
