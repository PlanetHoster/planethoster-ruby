module PlanethosterApi
  class Domain < ApiInterface
    BASE_DOMAIN_PATH = '/reseller-api'.freeze
    DOMAINS_METHODS_PATH = {
      tld_prices: [:get, '/tld-prices'],
      account_info: [:get, '/account-info'],
      check_availability: [:get, '/check-availability'],
      domain_info: [:get, '/domain-info'],
      get_contact_details: [:get, '/get-contact-details'],
      get_nameservers: [:get, '/get-nameservers'],
      get_ph_dns_records: [:get, '/get-ph-dns-records'],
      get_registrar_lock: [:get, '/get-registrar-lock'],
      save_contact_details: [:post, '/save-contact-details'],
      save_nameservers: [:post, '/save-nameservers'],
      save_ph_dns_records: [:post, '/save-ph-dns-records'],
      save_registrar_lock: [:post, '/save-registrar-lock'],
      email_epp_code: [:post, '/email-epp-code'],
      register_domain: [:post, '/register-domain'],
      renew_domain: [:post, '/renew-domain'],
      transfer_domain: [:post, '/transfer-domain'],
      delete_ph_dns_zone: [:post, '/delete-php-dns-zone']
    }.freeze

    DOMAINS_METHODS_PATH.each do |function_name, info|
      method = info.first
      path = "#{BASE_DOMAIN_PATH}#{info.last}"

      define_method(function_name) do |params = {}|
        @api_client.call(method, path, params)
      end
    end
  end
end
