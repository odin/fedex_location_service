module FedexLocationService
  class Response
    def self.build(message)
      if message.class == Savon::Response
        message.to_hash
      elsif message.class == Savon::SOAPFault
        original_message = message.to_hash

        custom_error_message = {
          search_locations_reply: {
            highest_severity: 'FATAL'
          }
        }

        original_message.merge(custom_error_message)
      end
    end
  end
end
