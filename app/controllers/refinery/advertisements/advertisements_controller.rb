module Refinery
  module Advertisements
    class AdvertisementsController < ::ApplicationController

      before_action :find_all_advertisements
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @advertisement in the line below:
        present(@page)
      end

      def show
        @advertisement = Advertisement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @advertisement in the line below:
        present(@page)
      end

      def edit
        @advertisement = Advertisement.find(params[:id])
        if !@advertisement.owner?(current_refinery_user)
          flash[:alert] = 'У вас нет прав на редактирование этого объявления.'
          redirect_to :back
        end
      end

      def update
        @advertisement = Advertisement.find(params[:id])
        if @advertisement.owner?(current_refinery_user)
          if @advertisement.update_attributes(advertisement_params)
            flash[:notice] = 'Объявление было обновлено.'
            redirect_to Refinery::Page.find_by_slug('ads').nested_path
          else
            redirect_to :back
          end
        else
          flash[:alert] = 'У вас нет прав на редактирование этого объявления.'
          redirect_to Refinery::Page.find_by_slug('ads').nested_path
        end
      end

      def destroy
        @advertisement = Advertisement.find(params[:id])
        if @advertisement.owner?(current_refinery_user)
          if @advertisement.destroy
            flash[:notice] = 'Объявление было удалено.'
          else
            flash[:alert] = 'Не удалось удалить объявление.'
          end
        else
          flash[:alert] = 'У вас нет прав на удаление этого объявления.'
        end
        redirect_to Refinery::Page.find_by_slug('ads').nested_path
      end

    protected

      def find_all_advertisements
        @advertisements = Advertisement.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/ads").first
      end

      def advertisement_params
        params.require(:advertisement).permit(:title, :body, :expiry_date, :category_id)
      end
    end
  end
end
