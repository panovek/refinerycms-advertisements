require 'refinerycms-core'
require 'dragonfly'

module Refinery
  autoload :AdvertisementsGenerator, 'generators/refinery/advertisements_generator'

  module Advertisements
    #require 'refinery/advertisements/dragonfly'
    require 'refinery/advertisements/engine'
    require 'refinery/advertisements/configuration'
    autoload :Dragonfly, 'refinery/advertisements/dragonfly'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
