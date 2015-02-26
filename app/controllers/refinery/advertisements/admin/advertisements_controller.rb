module Refinery
  module Advertisements
    module Admin
      class AdvertisementsController < ::Refinery::AdminController

        crudify :'refinery/advertisements/advertisement'

        protected

        def advertisement_params
          params.require(:advertisement).permit(:title, :body, :expiry_date, :category_id, :user_id)
        end
      end
    end
  end
end
