module PlanethosterApi
  class N0C < ApiInterface
    BASE_WORLD_PATH = '/n0c-api'.freeze
    N0C_METHODS_PATH = {
      # USER
      temporary_domain: [:post, '/user/temp-domain'],
      disable_temporary_domain: [:post, '/user/disable-temp-domain'],
      ssh_keys: [:get, '/user/ssh-keys'],
      add_ssh_keys: [:post, '/user/add-ssh-keys'],
      edit_ssh_keys: [:post, '/user/edit-ssh-keys'],
      remove_ssh_keys: [:post, '/user/remove-ssh-keys'],
      # DOMAINS
      domains: [:get, '/domains'],
      add_domain: [:post, '/domain/add'],
      remove_domain: [:post, '/domain/remove'],
      add_sub_domain: [:post, '/domain/add-sub-domain'],
      suspend_domain: [:post, '/domain/suspend'],
      unsuspend_domain: [:post, '/domain/unsuspend'],
      change_doc_root: [:post, '/domain/change-doc-root'],
      domain_redirections: [:get, '/domain/redirections'],
      domain_internal_redirection: [:post, '/domain/redirection'],
      domain_external_redirection: [:post, '/domain/external-redirection'],
      domain_delete_redirection: [:post, '/domain/delete-redirection'],
      waf_logs: [:get, '/domain/waf-logs'],
      waf_rules: [:get, '/domain/waf-rules'],
      update_waf_rules: [:post, '/domain/update-waf-rules'],
      # DNS
      dns_zone: [:get, '/dns/get-records'],
      reset_dns_zone: [:post, '/dns/reset-zone'],
      edit_dns_zone: [:post, '/dns/edit-zone'],
      # Email
      emails: [:get, '/emails'],
      add_email: [:post, '/email/add'],
      remove_email: [:post, '/email/remove'],
      email_change_password: [:post, '/email/change-password'],
      email_change_quota: [:post, '/email/change-quota'],
      suspend_email: [:post, '/email/suspend'],
      unsuspend_email: [:post, '/email/unsuspend'],
      email_authentication: [:get, '/email/auths'],
      enable_email_authentication: [:post, '/email/auth/enable'],
      disable_email_authentication: [:post, '/email/auth/disable'],
      # DATABASE
      databases: [:get, '/databases'],
      add_database: [:post, '/database/add'],
      remove_database: [:post, '/database/remove'],
      database_users: [:get, '/database/users'],
      add_database_users: [:post, '/database/user/add'],
      remove_database_users: [:post, '/database/user/remove'],
      add_permission_database_users: [:post, '/database/user/grant-access'],
      remove_permission_database_users: [:post, '/database/user/remove-access'],
      # CRON
      crons: [:get, '/crons'],
      add_cron: [:post, '/cron/add'],
      remove_cron: [:post, '/cron/remove'],
      set_cron_email: [:post, '/cron/email/set'],
      remove_cron_email: [:post, '/cron/email/remove'],
      # FTP
      ftp_accounts: [:get, '/ftp-accounts'],
      add_ftp_account: [:post, '/ftp-account/add'],
      remove_ftp_account: [:post, '/ftp-account/remove'],
      ftp_account_password: [:post, '/ftp-account/password'],
      ftp_account_path: [:post, '/ftp-account/update-path'],
      ftp_account_connections: [:get, '/ftp-account/active-connection'],
      # WORDPRESS
      wordpress: [:get, '/wordpress'],
      add_wordpress: [:post, '/wordpress/add'],
      remove_wordpress: [:post, '/wordpress/remove'],
      # CMS
      available_cms: [:get, '/cms/list-available'],
      install_cms: [:post, '/cms/install'],
      installed_cms: [:get, '/cms/list-installed'],
      cms_installations_progress: [:get, '/cms/installations-progress'],
      delete_cms: [:post, '/cms/delete'],
      # STATS
      stats_performance: [:post, '/stats/performance'],
      stats_disk_usage: [:get, '/stats/disk-usage'],
      stats_apache: [:post, '/stats/apache'],
      stats_apache_unique: [:post, '/stats/apache/unique']
    }.freeze

    N0C_METHODS_PATH.each do |function_name, info|
      method = info.first
      path = "#{BASE_WORLD_PATH}#{info.last}"

      define_method(function_name) do |params = {}|
        @api_client.call(method, path, params)
      end
    end
  end
end
