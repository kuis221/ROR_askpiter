class PicturesController < ApplicationController

  def create
    Picture.create! creation_params
    head :created
  end

  private

  def creation_params
    params.require(:picture).permit %i(title imageable_type imageable_id image)
  end
end
