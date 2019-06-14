module PlanethosterApi
  class World < ApiInterface

    BASE_WORLD_PATH = '/world-api'

    WORLD_METHODS_PATH = {
      get_accounts: [:get, '/get-accounts'],
      create_account: [:post, '/create-account'],
      suspend_account: [:post, '/suspend-account'],
      unsuspend_account: [:post, '/unsuspend-account'],
      modify_ressources: [:post, '/modify-ressources'],
      upgrade_plan: [:post, '/upgrade-plan'],
    }

    WORLD_METHODS_PATH.each do |function_name, info|
      method = info.first
      path = "#{BASE_WORLD_PATH}#{info.last}"
      params = params || {}

      define_method(function_name) do |params|
        @api_client.call(method, path, params)
      end
    end
  
  end
end