require "spec_helper"

RSpec.describe FedexLocationService::Message do
  before :each do
    Address = Struct.new(:address_one, :address_two, :city, :state, :postal_code)

    @address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
  end
  describe '.build(configuration, address)' do
    it 'builds a message that the Location Service SOAP API will accept' do
      expect(
        FedexLocationService::Message.build(
          FedexLocationService.configuration,
          @address
        )['Address'][0]['City']
      ).to eq('Richmond')
    end
  end
end
