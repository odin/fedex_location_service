require "spec_helper"

RSpec.describe FedexLocationService::Request do
  describe '.call(:search_locations, message: message)' do
    context 'when the address is formed correctly' do
      before :each do
        address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
        @message = FedexLocationService::Message.build(
          FedexLocationService.configuration,
          address
        )
      end

      vcr_options = { cassette_name: 'valid_location_service_request' }

      it 'returns a SOAP object response from the Fedex Web Services Location API', vcr: vcr_options do
        expect(FedexLocationService::Request.call(@message).class).to eq(Savon::Response)
      end

      it 'returns a SOAP object response with a status of "SUCCESS"', vcr: vcr_options do
        expect(
          FedexLocationService::Request.call(@message).body[:search_locations_reply][:highest_severity]
        ).to eq('SUCCESS')
      end
    end

    context 'when the address is formed correctly but has no results' do
      before :each do
        address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23235')
        @message = FedexLocationService::Message.build(
          FedexLocationService.configuration,
          address
        )
      end

      vcr_options = { cassette_name: 'location_service_request_no_results' }

      it 'returns a SOAP object response from the Fedex Web Services Location API', vcr: vcr_options do
        expect(FedexLocationService::Request.call(@message).class).to eq(Savon::Response)
      end

      it 'returns a SOAP object response with a status of "ERROR"', vcr: vcr_options do
        expect(
          FedexLocationService::Request.call(@message).body[:search_locations_reply][:highest_severity]
        ).to eq('ERROR')
      end
    end

    context 'when the address is formed incorrectly' do
      before :each do
        address = Address.new(nil, nil, 'Richmond', 'VA', '23235')
        @message = FedexLocationService::Message.build(
          FedexLocationService.configuration,
          address
        )
      end

      vcr_options = { cassette_name: 'invalid_location_service_request' }

      it 'returns a hash that contains the error message', vcr: vcr_options do
        expect(FedexLocationService::Request.call(@message).class).to eq(Hash)
      end

      it 'returns a "cause" of "UnrecoverableClientError"', vcr: vcr_options do
        expect(FedexLocationService::Request.call(@message)[:cause]).to eq('UnrecoverableClientError')
      end
    end
  end
end
