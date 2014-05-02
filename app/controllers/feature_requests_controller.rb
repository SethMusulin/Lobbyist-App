class FeatureRequestsController < ApplicationController
  def index
    @features = FeatureRequest.all
  end

  def new

  end

  def create
    @feature = FeatureRequest.new
    @feature.feature = params[:feature]
    @feature.save
    redirect_to '/feature_requests'
  end
end

