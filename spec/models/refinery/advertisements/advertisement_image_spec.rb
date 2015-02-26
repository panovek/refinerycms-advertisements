require 'spec_helper'

module Refinery
  module Advertisements
    describe AdvertisementImage do
      describe "validations" do
        subject do
          FactoryGirl.create(:advertisement_image)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
