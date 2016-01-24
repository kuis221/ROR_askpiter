class PhotosController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    photo = Photo.new creation_params.merge! main: false, day: false, user: current_user
    if photo.save
      redirect_to :back
    else
      render 'shared/errors', locals: { errors: photo.errors }
    end
  end

  private

  def creation_params
    params.require(:photo).permit %i(comment product_id category_id),
                                  picture_attributes: %i(title image)
  end
end
