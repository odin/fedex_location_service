module FedexLocationService
  class Locations
    def self.call(response)
      locations = response.body[:search_locations_reply][:address_to_location_relationships][:distance_and_location_details]

      location_details = []

      locations.each do |location|
        address = {
          company_name: location[:location_detail][:location_contact_and_address][:contact][:company_name],
          street:       location[:location_detail][:location_contact_and_address][:address][:street_lines],
          city:         location[:location_detail][:location_contact_and_address][:address][:city],
          state:        location[:location_detail][:location_contact_and_address][:address][:state_or_province_code],
          postal_code:  location[:location_detail][:location_contact_and_address][:address][:postal_code],
          distance:     location[:distance][:value],
          map_url:      location[:location_detail][:map_url]
        }

        location_details << address
      end

      return location_details
    end
  end
end
