module Refinery
  module Advertisements
    module Admin
      class AdvertisementImagesController < ::Refinery::AdminController

        crudify :'refinery/advertisements/advertisement_image'

      end
    end
  end
end
