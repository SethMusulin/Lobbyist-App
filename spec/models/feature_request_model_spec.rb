require 'spec_helper'


describe 'feature requests' do
  it "model does not allow an empty description entry" do
    request         = FeatureRequest.create!(:feature => 'allows user to take notes within the app')
    request.feature = ""
    expect(request).to_not be_valid
  end
end

