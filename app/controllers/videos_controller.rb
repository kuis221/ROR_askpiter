class VideosController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    video = Video.new creation_params.merge! main: false, day: false, user: current_user
    if video.save
      redirect_to :back
    else
      render 'shared/errors', locals: { errors: video.errors }
    end
  end

  private

  def creation_params
    params.require(:video).permit %i(url title comment product_id category_id)
  end
end
