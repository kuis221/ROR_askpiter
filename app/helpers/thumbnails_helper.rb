module ThumbnailsHelper

  def product_thumbnails products
    capture { render partial: 'products/thumbnail', collection: products, as: :product }
  end

  def picture_thumbnails pictures
    capture { render partial: 'pictures/thumbnail', collection: pictures, as: :picture }
  end

  def photo_thumbnails photos
    capture { render partial: 'photos/thumbnail', collection: photos, as: :photo }
  end

  def video_thumbnails videos
    capture { render partial: 'videos/thumbnail', collection: videos, as: :video }
  end

end
