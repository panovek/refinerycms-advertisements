module Refinery
  module Advertisements
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/advertisements/category',
                :title_attribute => 'name'

        protected

        def category_params
          params.require(:category).permit(:name)
        end

      end
    end
  end
end
