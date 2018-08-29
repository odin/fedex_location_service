require 'fedex_location_service/configuration'
require 'fedex_location_service/locations'
require 'fedex_location_service/message'
require 'fedex_location_service/request'
require 'fedex_location_service/response'
require 'fedex_location_service/version'

require 'savon'

module FedexLocationService
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.root
    Pathname.new File.expand_path('..', __dir__)
  end
end
