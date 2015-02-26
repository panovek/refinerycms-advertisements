module Refinery
  module Advertisements
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Advertisements

      engine_name :refinery_advertisements

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "advertisements"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.advertisements_admin_advertisements_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Advertisements)
      end
    end
  end
end
