module FedexLocationService
  class Message
    def self.build(key, password, account_number, meter_number, address_one, address_two, city, state, postal_code)
      { 'WebAuthenticationDetail' => [
          'ParentCredential' => [
            'Key' => key,
            'Password' => password
          ],
          'UserCredential' => [
            'Key' => key,
            'Password' => password
          ]
        ],
        'ClientDetail' => [
          'AccountNumber' => account_number,
          'MeterNumber' => meter_number
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
            address_one,
            address_two
          ],
          'City' => city,
          'StateOrProvinceCode' => state,
          'PostalCode' => postal_code,
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
          'ResultsRequested' => 5,
        ]
      }
    end
  end
end
