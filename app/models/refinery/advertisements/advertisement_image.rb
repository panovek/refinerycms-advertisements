module Refinery
  module Advertisements
    class AdvertisementImage < Refinery::Core::BaseModel
      #extend Dragonfly::Model::Validations

      self.table_name = 'refinery_advertisements_images'

      dragonfly_accessor :image, :app => :refinery_advertisements
      #validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :gif], case_sensitive: false,
      #                   message: "should be either .jpeg, .jpg, .png, .gif"
      validates_size_of :image, maximum: 2.megabytes, message: "should be no more than 2 MB"

      belongs_to :advertisement

      delegate :ext, :size, :mime_type, :url,
               :to        => :image,
               :allow_nil => true
    end
  end
end
