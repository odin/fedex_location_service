# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FedexLocationService::Response do
  describe '.build(message)' do
    context 'when the address is formed correctly' do
      before :each do
        address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
        @message = FedexLocationService::Message.build(
          FedexLocationService.configuration,
          address
        )
      end

      vcr_options = { cassette_name: 'valid_location_service_request' }

      it 'returns a status of \'SUCCESS\'', vcr: vcr_options do
        expect(
          FedexLocationService::Response.build(
            FedexLocationService::Request.call(@message)
          )[:search_locations_reply][:highest_severity]
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

      it 'returns a status of \'ERROR\'', vcr: vcr_options do
        expect(
          FedexLocationService::Response.build(
            FedexLocationService::Request.call(@message)
          )[:search_locations_reply][:highest_severity]
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

      it 'returns a status of \'FATAL\'', vcr: vcr_options do
        expect(
          FedexLocationService::Response.build(
            FedexLocationService::Request.call(@message)
          )[:search_locations_reply][:highest_severity]
        ).to eq('FATAL')
      end
    end
  end
end
