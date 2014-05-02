class FeatureRequest < ActiveRecord::Base

  validates :feature, presence: true
end
