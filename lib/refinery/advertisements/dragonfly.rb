require 'dragonfly'

module Refinery
  module Advertisements
    module Dragonfly

      class << self
        def configure!
          ActiveRecord::Base.extend ::Dragonfly::Model
          ActiveRecord::Base.extend ::Dragonfly::Model::Validations

          app_advertisements = ::Dragonfly.app(:refinery_advertisements)
          app_advertisements.configure do
            # datastore ::Dragonfly::DataStorage::MongoDataStore.new(:db => MongoMapper.database)
            datastore :file, {
                :root_path => Refinery::Advertisements.datastore_root_path
            }
            url_format Refinery::Advertisements.dragonfly_url_format
            secret Refinery::Advertisements.dragonfly_secret
          end

          if ::Refinery::Advertisements.s3_backend
            require 'dragonfly/s3_data_store'
            options = {
                bucket_name: Refinery::Advertisements.s3_bucket_name,
                access_key_id: Refinery::Advertisements.s3_access_key_id,
                secret_access_key: Refinery::Advertisements.s3_secret_access_key
            }
            # S3 Region otherwise defaults to 'us-east-1'
            options.update(region: Refinery::Advertisements.s3_region) if Refinery::Advertisements.s3_region
            app_advertisements.use_datastore :s3, options
          end
        end

        def attach!
          Rails.application.config.middleware.use ::Dragonfly::Middleware, :refinery_advertisements
        end
      end

    end
  end
end
