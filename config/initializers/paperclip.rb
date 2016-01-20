module Paperclip

  interpolates :placeholder do |attachment, style|
    asset_name = "#{attachment.send :interpolate, ':class'}_#{attachment.name}_#{style}"
    ActionController::Base.helpers.asset_path("#{asset_name}.png")
  end

  class Attachment

    default_options.merge!({
      filename_cleaner: -> (filename) { SecureRandom.hex },
      default_url: ':placeholder',
    })

    unless %w(development test).include? Rails.env
      default_options.merge!({
        storage: :s3,
        s3_credentials:
        {
          bucket: ENV['S3_BUCKET_NAME'],
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        },
      })
    end

  end
end
