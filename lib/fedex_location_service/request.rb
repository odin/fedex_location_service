module FedexLocationService
  class Request
    def self.call(address)
      client = Savon.client(wsdl: FedexLocationService.configuration.wsdl)

      message = FedexLocationService::Message.build(
        FedexLocationService.configuration,
        address
      )

      begin
        @response = client.call(:search_locations, message: message)
      rescue Savon::SOAPFault => error
        puts error.http.inspect
      end

      return @response
    end
  end
end
