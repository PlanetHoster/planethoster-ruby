![Gem](https://img.shields.io/gem/v/planethoster_api.svg)
[![Build Status](https://travis-ci.org/PlanetHoster/planethoster-node.svg?branch=master)](https://travis-ci.org/PlanetHoster/planethoster-node)
![Gem](https://img.shields.io/gem/dt/planethoster_api.svg)

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

You need to configure api credentials.
```ruby
PlanethosterApi.configuration do |config|
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports are welcome on GitHub at https://github.com/PlanetHoster/planethoster-ruby/issues.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
