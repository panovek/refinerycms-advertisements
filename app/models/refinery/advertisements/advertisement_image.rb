module Refinery
  module Advertisements
    class AdvertisementImage < Refinery::Core::BaseModel

      #def title
      #  "Override def title in vendor/extensions/advertisements/app/models/refinery/advertisements/advertisement_image.rb"
      #end

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :advertisement

    end
  end
end
