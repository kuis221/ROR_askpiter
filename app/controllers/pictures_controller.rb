class PicturesController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    Picture.create! creation_params
    redirect_to :back
  end

  private

  def creation_params
    params.require(:picture).permit %i(title imageable_type imageable_id image)
  end
end
