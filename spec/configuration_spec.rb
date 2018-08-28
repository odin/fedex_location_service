require 'spec_helper'

module FedexLocationService
  RSpec.describe Configuration do
    describe '#wsdl' do
      it 'default value is nil' do
        expect(Configuration.new.wsdl).to eq(nil)
      end
    end

    describe '#key' do
      it 'default value is nil' do
        expect(Configuration.new.key).to eq(nil)
      end
    end

    describe '#password' do
      it 'default value is nil' do
        expect(Configuration.new.password).to eq(nil)
      end
    end

    describe '#account_number' do
      it 'default value is nil' do
        expect(Configuration.new.account_number).to eq(nil)
      end
    end

    describe '#meter_number' do
      it 'default value is nil' do
        expect(Configuration.new.meter_number).to eq(nil)
      end
    end

    describe '#wsdl=' do
      it 'can set value of wsdl' do
        config      = Configuration.new
        config.wsdl = '/path/to/wsdl.wsdl'
        expect(config.wsdl).to eq('/path/to/wsdl.wsdl')
      end
    end

    describe '#key=' do
      it 'can set value of key' do
        config     = Configuration.new
        config.key = 'NEW_KEY'
        expect(config.key).to eq('NEW_KEY')
      end
    end

    describe '#password=' do
      it 'can set value of password' do
        config          = Configuration.new
        config.password = 'NEW_PASS'
        expect(config.password).to eq('NEW_PASS')
      end
    end

    describe '#account_number=' do
      it 'can set value of account_number' do
        config                = Configuration.new
        config.account_number = 'ACCT_NUM'
        expect(config.account_number).to eq('ACCT_NUM')
      end
    end

    describe '#meter_number=' do
      it 'can set value of meter_number' do
        config              = Configuration.new
        config.meter_number = 'MET_NUM'
        expect(config.meter_number).to eq('MET_NUM')
      end
    end
  end
end
