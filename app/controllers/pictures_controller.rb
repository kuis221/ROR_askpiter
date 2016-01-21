class PicturesController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    Picture.create! creation_params
    head :created
  end

  private

  def creation_params
    params.require(:picture).permit %i(title imageable_type imageable_id image)
  end
end
