module Refinery
  module Advertisements
    class AdvertisementImagesController < ::ApplicationController

      def destroy
        image_file = AdvertisementImage.find_by_id(params[:id])
        if image_file.present? && image_file.advertisement.user == current_refinery_user
          @image_file_id = image_file.id
          image_file.destroy
        else
          render "error"
        end
      end

    protected

    end
  end
end
