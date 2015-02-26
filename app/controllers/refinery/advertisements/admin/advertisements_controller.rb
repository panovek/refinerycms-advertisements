module Refinery
  module Advertisements
    module Admin
      class AdvertisementsController < ::Refinery::AdminController

        crudify :'refinery/advertisements/advertisement'

      end
    end
  end
end
