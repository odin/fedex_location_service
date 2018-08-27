require "spec_helper"

RSpec.describe FedexLocationService::Message do
  describe '.build(configuration, address)' do
    before :each do
      @address = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')
    end

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
