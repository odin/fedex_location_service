module FedexLocationService
  class Request
    def self.call(message)
      client = Savon.client(wsdl: FedexLocationService.configuration.wsdl)

      begin
        @response = client.call(:search_locations, message: message)
      rescue Savon::SOAPFault => error
        @response = error
      end
    end
  end
end
