require 'spec_helper'
require 'legiscan_api'

describe "LegiScanApi" do
  it 'returns bill information after user inputs necessary information' do
    #stub for CO HB1030, located in fixtures/vcr_cassettes/legiscan
    VCR.use_cassette('legiscan/bills') do
      response = LegiScanApi.new("CO", "HB1030")
      response_body = response.call

      expect(response_body["status"]).to eq("OK")
      expect(response_body["bill"]["state"]).to eq("CO")
      expect(response_body["bill"]["session"]["session_name"]).to eq("2014 Regular Session")


    end
  end
end