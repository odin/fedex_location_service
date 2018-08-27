require "spec_helper"

RSpec.describe FedexLocationService do
  it "has a version number" do
    expect(FedexLocationService::VERSION).not_to be nil
  end

  describe "#configure" do
    before do
      FedexLocationService.configure do |config|
        config.wsdl           = 'wsdl'
        config.key            = 'key'
        config.password       = 'pass'
        config.account_number = 'acct'
        config.meter_number   = 'meter'
      end
    end

    it "returns the configured options" do
      expect(FedexLocationService.configuration.wsdl).to eq('wsdl')
      expect(FedexLocationService.configuration.key).to eq('key')
      expect(FedexLocationService.configuration.password).to eq('pass')
      expect(FedexLocationService.configuration.account_number).to eq('acct')
      expect(FedexLocationService.configuration.meter_number).to eq('meter')
    end

    after do
      FedexLocationService.reset
    end
  end
end
