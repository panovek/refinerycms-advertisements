Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :advertisements do
    resources :advertisements, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :advertisements, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :advertisements, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
