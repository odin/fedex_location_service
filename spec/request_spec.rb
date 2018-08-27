require "spec_helper"

RSpec.describe FedexLocationService::Request do
  describe '.call(:search_locations, message: message)' do
    before :each do
      address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
      @message = FedexLocationService::Message.build(
        FedexLocationService.configuration,
        address
      )
    end

    vcr_options = { cassette_name: 'location_service_request' }

    it 'Returns a SOAP object response from the Fedex Web Services Location API', vcr: vcr_options do
      expect(FedexLocationService::Request.call(@message).class).to eq(Savon::Response)
    end
  end
end
