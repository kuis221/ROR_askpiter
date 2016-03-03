class ModalsController < ApplicationController
  include ImitateDelay
  include HelperAttr

  helper_attr :body_locals

  before_action { request.format = :json }
  before_action { self.body_locals ||= {} }
  before_action :set_addendum_locals, only: %i(add_photo add_video add_picture)

  imitate_delay
  layout false

  private

  def set_addendum_locals
    @categories = Category.includes(:products).all
    @companies = Company.includes(:products).all
    @products = []
  end
end
