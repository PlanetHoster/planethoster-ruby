module PlanethosterApi
  class Configuration
    attr_accessor :api_key, :api_user

    # Empty strings if not defined
    def initialize
      @api_key = ""
      @api_user = ""
    end

  end
end