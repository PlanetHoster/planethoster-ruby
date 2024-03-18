module PlanethosterApi
  class Configuration
    attr_accessor :api_user, :api_key

    # Empty strings if not defined
    def initialize
      @api_user = ''
      @api_key = ''
    end
  end
end
