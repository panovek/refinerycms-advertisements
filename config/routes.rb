Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :advertisements do
    resources :advertisements, :path => '', :only => [:index, :show, :destroy, :edit, :update]
    resources :advertisement_images, :only => [:destroy]
  end

  # Admin routes
  namespace :advertisements, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :advertisements, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :advertisement_images, :only => [:destroy]
    end
  end


  # Frontend routes
  #namespace :advertisements do
  #  resources :categories, :only => [:index, :show]
  #end

  # Admin routes
  namespace :advertisements, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/advertisements" do
      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

  # Admin routes
  #namespace :advertisements, :path => '' do
  #  namespace :admin, :path => "#{Refinery::Core.backend_route}/advertisements" do
  #    resources :advertisement_images, :except => :show do
  #      collection do
  #        post :update_positions
  #      end
  #    end
  #    resources :advertisement_images, :only => [:destroy]
  #  end
  #end

end
