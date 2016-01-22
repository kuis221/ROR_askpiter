class PhotosController < ApplicationController
  include ImitateDelay
  imitate_delay only: :create

  def create
    Photo.create! creation_params.merge! main: false, day: false, user: current_user
    redirect_to :back
  end

  private

  def creation_params
    params.require(:photo).permit %i(main day comment product_id category_id),
                                  picture_attributes: %i(title image)
  end
end
