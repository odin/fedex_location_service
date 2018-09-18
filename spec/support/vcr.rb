# frozen_string_literal: true

VCR.configure do |c|
  c.cassette_library_dir = FedexLocationService.root.join('spec', 'vcr')
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end
