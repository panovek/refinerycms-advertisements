module Refinery
  module Advertisements
    module Admin
      class AdvertisementImagesController < ::Refinery::AdminController

        #crudify :'refinery/advertisements/advertisement_image'

        respond_to :js

        def destroy
          image_file = AdvertisementImage.find_by_id(params[:id])
          if image_file.present? && image_file.advertisement.user == current_refinery_user
            @image_file_id = image_file.id
            image_file.destroy
          else
            render "error"
          end
        end
      end
    end
  end
end
