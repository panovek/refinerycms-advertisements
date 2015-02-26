module Refinery
  module Advertisements
    class AdvertisementImagesController < ::ApplicationController

      before_action :find_all_advertisement_images
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @advertisement_image in the line below:
        present(@page)
      end

      def show
        @advertisement_image = AdvertisementImage.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @advertisement_image in the line below:
        present(@page)
      end

    protected

      def find_all_advertisement_images
        @advertisement_images = AdvertisementImage.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/advertisement_images").first
      end

    end
  end
end
