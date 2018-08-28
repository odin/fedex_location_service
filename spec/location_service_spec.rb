require 'spec_helper'

RSpec.describe FedexLocationService do
  it 'has a version number' do
    expect(FedexLocationService::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'returns the configured options' do
      expect(FedexLocationService.configuration.wsdl).to eq(ENV['WSDL'])
      expect(FedexLocationService.configuration.key).to eq(ENV['KEY'])
      expect(FedexLocationService.configuration.password).to eq(ENV['PASSWORD'])
      expect(FedexLocationService.configuration.account_number).to eq(ENV['ACCOUNT_NUMBER'])
      expect(FedexLocationService.configuration.meter_number).to eq(ENV['METER_NUMBER'])
    end
  end

  describe '.root' do
    it 'returns a Pathname object that is the root directory of the gem' do
      expect(FedexLocationService.root.class).to eq(Pathname)
    end
  end
end
