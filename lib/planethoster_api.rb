require 'planethoster_api/version'
require 'planethoster_api/configuration'
require 'planethoster_api/api_interface'
require 'planethoster_api/domain'
require 'planethoster_api/world'
require 'planethoster_api/n0c'

module PlanethosterApi
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

  def self.domain
    creds_wrap do
      PlanethosterApi::Domain.new(
        @configuration.api_user,
        @configuration.api_key
      )
    end
  end

  def self.world
    creds_wrap do
      PlanethosterApi::World.new(
        @configuration.api_user,
        @configuration.api_key
      )
    end
  end

  def self.n0c
    creds_wrap do
      PlanethosterApi::N0C.new(
        @configuration.api_user,
        @configuration.api_key
      )
    end
  end

  private
  def self.creds_wrap
    if @configuration.nil?
      raise 'api_key and api_user are not defined - Please refer to documentation and configure credentials: ' \
              'https://github.com/PlanetHoster/planethoster-ruby'
    end
    yield
  end
end
