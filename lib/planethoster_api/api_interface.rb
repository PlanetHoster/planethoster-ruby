require 'utilities/api_client'

module PlanethosterApi
  class ApiInterface
    include Utilities

    def initialize(api_user, api_key)
      @api_client = ApiClient.new(api_user, api_key)
    end

    def test_connection
      @api_client.call(
        :get,
        '/reseller-api/test-connection',
        {}
      )
    end
  end
end
