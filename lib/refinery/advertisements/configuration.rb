module Refinery
  module Advertisements
    include ActiveSupport::Configurable

    config_accessor :dragonfly_secret, :dragonfly_url_format,
                    :max_image_size, :pages_per_dialog, :pages_per_admin_index,
                    :s3_backend, :s3_bucket_name, :s3_region,
                    :s3_access_key_id, :s3_secret_access_key,
                    :datastore_root_path, :trust_image_extensions

    self.dragonfly_secret = Refinery::Core.dragonfly_secret
    self.dragonfly_url_format = '/system/advertisement_images/:job/:basename.:format'
    self.trust_image_extensions = false
    self.max_image_size = 524288000
    self.pages_per_dialog = 7
    self.pages_per_admin_index = 20
    #self.whitelisted_mime_types = %w(video/mp4 video/x-flv application/ogg video/webm video/flv video/ogg)
    #self.skin_css_class = "vjs-default-skin"

    class << self
      def datastore_root_path
        config.datastore_root_path || (Rails.root.join('public', 'system', 'refinery', 'advertisement_images').to_s if Rails.root)
      end

      def s3_region
        config.s3_region.nil? ? Refinery::Core.s3_region : config.s3_region
      end

      def s3_backend
        config.s3_backend.nil? ? Refinery::Core.s3_backend : config.s3_backend
      end

      def s3_bucket_name
        config.s3_bucket_name.nil? ? Refinery::Core.s3_bucket_name : config.s3_bucket_name
      end

      def s3_access_key_id
        config.s3_access_key_id.nil? ? Refinery::Core.s3_access_key_id : config.s3_access_key_id
      end

      def s3_secret_access_key
        config.s3_secret_access_key.nil? ? Refinery::Core.s3_secret_access_key : config.s3_secret_access_key
      end
    end
  end
end
