class ModalsController < ApplicationController
  include ImitateDelay
  include HelperAttr

  helper_attr :body_locals

  before_action { request.format = :json }
  before_action { self.body_locals ||= {} }
  before_action :set_addendum_locals, only: %i(add_photo add_video)

  imitate_delay
  layout false

  private

  def set_addendum_locals
    case
    when params[:product_id]
      product = Product.find_by id: params[:product_id]
      category = product.category
    when params[:category_id]
      category = Category.find_by id: params[:category_id]
      products = category.products
    else
      categories = Category.includes(:products).all
    end

    self.body_locals[:addendum_locals] = OpenStruct.new({
      product: product,
      products: products,
      category: category,
      categories: categories,
    }).freeze
  end
end
