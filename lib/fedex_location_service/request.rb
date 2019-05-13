# frozen_string_literal: true

module FedexLocationService
  class Request
    def self.call(message)
      client = Savon.client(wsdl: FedexLocationService.configuration.wsdl)

      begin
        @response = client.call(:search_locations, message: message)
      rescue Savon::SOAPFault => e
        @response = e
      end
    end
  end
end
