[![CircleCI](https://dl.circleci.com/status-badge/img/gh/PlanetHoster/planethoster-ruby/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/PlanetHoster/planethoster-ruby/tree/master)
[![Gem Version](https://badge.fury.io/rb/planethoster_api.svg)](https://badge.fury.io/rb/planethoster_api)
[![Gem](https://img.shields.io/gem/dt/planethoster_api.svg)](https://rubygems.org/gems/planethoster_api)

# Planethoster-ruby

PlanetHoster API wrapper

Please refer to the documentation of the [PlanetHoster API](https://apidoc.planethoster.com/) for all calls explanation.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'planethoster_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install planethoster_api

## Usage

You need to initialize api credentials.
```ruby
require 'planethoster_api'

PlanethosterApi.configure do |config|
    config.api_user = API_USER
    config.api_key = API_KEY
end
```

Then, you can test api connection with this code
```ruby
PlanethosterApi.domain.test_connection
```

## Possible functions

Make sure to checkout documentation for specific parameters and more explanation [ApiDoc](https://apidoc.planethoster.com/)

### Domain
```ruby
PlanethosterApi.domain[...] # options down below
```
```ruby
.tld_prices() # Returns domain name prices for registration, renewal and transfer.
.account_info() # Returns information pertinent to your reseller account. (active doamin, credit left, etc..)
.check_availability() # Checks whether a domain name is available to register.
.domain_info() # Retrieve information for a domain which you successfully registered or created a transfer order.
.get_contact_details() # Returns the contact information (WHOIS information) for the active domain name.
.get_nameservers() # Returns the nameservers for a registered domain name.
.get_ph_dns_records() # Retrieves the DNS records for the active domain name registered with PlanetHoster.
.get_registrar_lock() # Get the lock status of a registered domain name.
.save_contact_details() # Saves the contact information (WHOIS information) for the given active domain name.
.save_nameservers() # Update nameservers associated with your domain.
.save_ph_dns_records() # Saves the DNS records for the active domain name registered with PlanetHoster.
.save_registrar_lock() # Lock or unlock a registered and active domain name.
.email_epp_code() # Email the domain name registrant their EPP code (also called Auth Info) for the given domain.
.register_domain() # Attempts to register a domain name for 1 to 10 years.
.renew_domain() # Renew an already active domain name for 1-10 years.
.transfer_domain() # Transfer a domain name from your current registrar to PlanetHoster.
.delete_ph_dns_zone() # Deletes the DNS zone on the PlanetHoster DNS servers for the given domain.
```
### World (Hosting)
[What is a world hosting?](https://www.planethoster.com/en/World-Hosting)
```ruby
PlanethosterApi.world[...] # options down below
```
```ruby
.get_accounts() # Displays The World account and all World sub accounts information.
.create_account() # Creates a world hosting account, assigns the requested resources and install a CMS
.suspend_account() # Proceed to the suspension of a World account.
.unsuspend_account() # Reactivate suspended world account.
.modify_ressources() # Modify the resources associated with a World account.
.upgrade_plan() # Increases resources associated with The World account.
```
### N0C (Hosting)
[What is a N0C hosting?](https://kb.n0c.com/en/what-is-n0c/)
```ruby
PlanethosterApi.n0c[...] # options down below
```
```ruby
.temporary_domain() # Generate a free temporary domain to access your main website.
.disable_temporary_domain() # Disable the temporary domain.
.ssh_keys() # Get SSH keys installed for an account.
.add_ssh_keys() # Add a SSH key to the World account.
.edit_ssh_keys() # Edit an existing SSH key.
.remove_ssh_keys() # Remove an existing SSH key.
.domains() # Get all domains of the account.
.add_domain() # Add a domain to the World account.
.remove_domain() # Remove the domain from the World account.
.add_sub_domain() # Add a sub-domain to the World account.
.suspend_domain() # Suspend one or multiple domains.
.unsuspend_domain() # Unsuspend one or multiple domains.
.change_doc_root() # Change document root for a domain.
.domain_redirections() # Get domain redirections.
.domain_internal_redirection() # Redirection that will force HTTPS or www, for example.
.domain_external_redirection() # Set an external domain redirection.
.domain_delete_redirection() # Delete redirection for a domain.
.waf_logs() # Get domain WAF logs.
.waf_rules() # Get the domain WAF rules.
.update_waf_rules() # Update WAF rules for the domain.
.dns_zone() # Find the complete dns zone.
.reset_dns_zone() # Will add the default values of the dns zone.
.edit_dns_zone() # Allows you to add or modify records on the DNS zone
.emails() # Get all account emails.
.add_email() # Create a new email address.
.remove_email() # Remove an email address.
.email_change_password() # Change the password of an email account.
.email_change_quota() # Change quota of an email account.
.suspend_email() # Suspend multiple email addresses.
.unsuspend_email() # Unsuspend multiple email addresses.
.email_authentication() # List email authentication.
.enable_email_authentication() # Enable email authentication.
.disable_email_authentication() # Disable email authentication.
.databases() # Get World account databases.
.add_database() # Create a new database.
.remove_database() # Remove database.
.database_users() # Get World account database users.
.add_database_users() # Create a new database user.
.remove_database_users() # Remove a database user.
.add_permission_database_users() # Grant access to a database for a user.
.remove_permission_database_users() # Remove access to a database for an user.
.crons() # Get world the cron jobs of the World account.
.add_cron() # Add cron to the World account.
.remove_cron() # Remove an existing cron job.
.set_cron_email() # Set cron email.
.remove_cron_email() # Remove cron email.
.ftp_accounts() # Get all FTP accounts.
.add_ftp_account() # Create an FTP account.
.remove_ftp_account() # Remove an FTP account.
.ftp_account_password() # Change the password of the FTP account.
.ftp_account_path() # Update the path of the FTP account.
.ftp_account_connections() # List all active connections.
.wordpress() # Get Wordpress paths installed.
.add_wordpress() # Wordpress installation
.remove_wordpress() # Removing a wordpress installation
.available_cms() # List the cms available for installation and their versions.
.install_cms() # Start the installation of a CMS
.installed_cms() # List the CMS installed on the hosting
.cms_installations_progress() # List CMS that have recently been installed or are in the process of being installed
.delete_cms() # Delete a CMS installation
.stats_performance() # Retrieve performance data
.stats_disk_usage() # Returns disk space usage (response always in BYTE)
.stats_apache() # Web server statistics (Visits)
.stats_apache_unique() # Web server statistics (Visits)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports are welcome on GitHub at https://github.com/PlanetHoster/planethoster-ruby/issues.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
