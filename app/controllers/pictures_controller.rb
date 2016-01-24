class PicturesController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    picture = Picture.new creation_params
    if picture.save
      redirect_to :back
    else
      render 'shared/errors', locals: { errors: picture.errors }
    end
  end

  private

  def creation_params
    params.require(:picture).permit %i(title imageable_type imageable_id image)
  end
end
