require 'planethoster_api/version'
require 'planethoster_api/configuration'
require 'planethoster_api/api_interface'
require 'planethoster_api/domain'
require 'planethoster_api/world'

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
    PlanethosterApi::Domain.new(
      @configuration.api_user,
      @configuration.api_key
    )
  end

  def self.world
    PlanethosterApi::World.new(
      @configuration.api_user,
      @configuration.api_key
    )
  end

end
