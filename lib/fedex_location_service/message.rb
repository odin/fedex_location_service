module FedexLocationService
  class Message
    def self.build(configuration, address)
      { 'WebAuthenticationDetail' => [
          'ParentCredential' => [
            'Key' => configuration.key,
            'Password' => configuration.password
          ],
          'UserCredential' => [
            'Key' => configuration.key,
            'Password' => configuration.password
          ]
        ],
        'ClientDetail' => [
          'AccountNumber' => configuration.account_number,
          'MeterNumber' => configuration.meter_number
        ],
        'TransactionDetail' => [
          'CustomerTransactionId' => 'location_service gem'
        ],
        'Version' => [
          'ServiceId' => 'locs',
          'Major' => '7',
          'Intermediate' => '0',
          'Minor' => '0'
        ],
        'EffectiveDate' => Date.today.to_s,
        'LocationsSearchCriterion' => 'ADDRESS',
        'Address' => [
          'StreetLines' => [
            address.address_one,
            ## address_two cannot be nil
            address.address_two || ''
          ],
          'City' => address.city,
          'StateOrProvinceCode' => address.state,
          'PostalCode' => address.postal_code,
          'CountryCode' => 'US'
        ],
        'MultipleMatchesAction' => 'RETURN_ALL',
        'SortDetail' => [
          'Criterion' => 'DISTANCE',
          'Order' => 'LOWEST_TO_HIGHEST'
        ],
        'Constraints' => [
          'RadiusDistance' => [
            'Value' => 15.0,
            'Units' => 'MI'
          ],
          'RequiredLocationAttributes' => [
            'WEEKDAY_EXPRESS_HOLD_AT_LOCATION'
          ],
          'ResultsRequested' => 5
        ]
      }
    end
  end
end
