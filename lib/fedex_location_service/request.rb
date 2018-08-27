module FedexLocationService
  class Request
    def self.call(address)
      client = Savon.client(wsdl: LocationService.configuration.wsdl)

      message = LocationService::Message.build(
        LocationService.configuration.key,
        LocationService.configuration.password,
        LocationService.configuration.account_number,
        LocationService.configuration.meter_number,
        address.address_one,
        address.address_two ? address.address_two : '', # This cannot be nil.
        address.city,
        address.state,
        address.postal_code
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
