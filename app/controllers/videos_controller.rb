class VideosController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    Video.create! creation_params.merge! main: false, day: false, user: current_user
    redirect_to :back
  end

  private

  def creation_params
    params.require(:video).permit %i(url title comment product_id category_id)
  end
end
