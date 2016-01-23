module ThumbnailsHelper

  def thumbnails_container
    raise ArgumentError, 'Missing block' unless block_given?

    content_tag :div, class: 'main-container' do
      content_tag :div, class: 'main-content-wrapper' do
        content_tag :div, class: 'flex thumbs-matrix-wrapper' do
          yield
        end
      end
    end
  end

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
