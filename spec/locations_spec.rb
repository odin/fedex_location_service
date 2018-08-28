require 'spec_helper'

RSpec.describe FedexLocationService::Locations do
  describe '.call(response)' do
    before :each do
      address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
      @message = FedexLocationService::Message.build(
        FedexLocationService.configuration,
        address
      )
    end

    vcr_options = { cassette_name: 'location_service_request' }

    it 'returns a nice hash of the 5 closest locations', vcr: vcr_options do
      response = FedexLocationService::Request.call(@message)

      expect(FedexLocationService::Locations.call(response).first).to eq(
        {
          :company_name => 'Walgreens 3685',
          :street       => '5802 W Broad St',
          :city         => 'Richmond',
          :state        => 'VA',
          :postal_code  => '23230',
          :distance     => '0.275',
          :map_url      => 'https://maps.googleapis.com/maps/api/staticmap?size=350x350&zoom=15&markers=color:blue%7Clabel:A%7C37.59091,-77.50386&maptype=roadmap&sensor=false'
        }
      )
    end
  end
end
