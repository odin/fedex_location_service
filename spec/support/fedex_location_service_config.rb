# frozen_string_literal: true

FedexLocationService.configure do |c|
  c.wsdl           = ENV['WSDL']
  c.key            = ENV['KEY']
  c.password       = ENV['PASSWORD']
  c.account_number = ENV['ACCOUNT_NUMBER']
  c.meter_number   = ENV['METER_NUMBER']
end
