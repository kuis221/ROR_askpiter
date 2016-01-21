module ImitateDelay
  extend ActiveSupport::Concern

  included do
    private def imitate_delay
      sleep 2
    end
  end

  class_methods do
    def imitate_delay **options
      before_action :imitate_delay, options if Rails.env.development?
    end
  end
end
