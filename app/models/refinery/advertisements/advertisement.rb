require 'dragonfly'

module Refinery
  module Advertisements
    class Advertisement < Refinery::Core::BaseModel
      self.table_name = 'refinery_advertisements'

      belongs_to :category
      belongs_to :user
      has_many :advertisement_images, dependent: :destroy
      #has_many :images, through: :advertisement_images, source: :image
      accepts_nested_attributes_for :advertisement_images

      validates :title, :presence => true
      validates :body, :presence => true
      validates :user, :presence => true
      validates :category, :presence => true

      scope :not_expired, -> {
        advertisements = Arel::Table.new(Advertisement.table_name)
        where(advertisements[:expiry_date].eq(nil).or(advertisements[:expiry_date].gt(Time.now)))
      }

      def owner?(current_user)
        current_user && (self.user == current_user || current_user.has_role?(:refinery))
      end

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
