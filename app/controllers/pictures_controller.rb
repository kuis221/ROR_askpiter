class PicturesController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create
  layout false, only: :create
  # before_action -> { request.format = :json }, only: :create

  def create
    Picture.create! creation_params
  end

  private

  def creation_params
    params.require(:picture).permit %i(title imageable_type imageable_id image)
  end
end
