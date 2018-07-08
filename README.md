# algosec

Chef Cookbook to DevOps-ify network security management, leveraging AlgoSec's business-driven security policy management solution.

## SCOPE

This cookbook is concerned with all [AlgoSec](https://www.algosec.com) services:

- AlgoSec BusinessFlow
- AlgoSec FireFlow
- AlgoSec Firewall Analyzer

## Requirements

- Chef 12.7+
- AlgoSec Ruby SDK >= 0.1.0

## Usage

This cookbook is not intended to include any recipes.
Use it by specifying a dependency on this cookbook in your own cookbook.

Please see the [Examples README](examples/README.md) for a thorough explanation of how to use this package.
The README file will walk you through all the steps from installing Chef and its dependencies, to running a live example. 

```ruby
# my_cookbook/metadata.rb
depends 'algosec'

algosec = { host: 'local.algosec.com', user: 'admin', password: 'algosec123' }

# Example: Define the application flows for application 'testApp'
# This will delete/modify/create flows as needed to match this flows definition on the server
algosec_application_flows 'define new application flows' do
  algosec_options algosec
  application_name 'testApp'
  application_flows(
    'flow1' => {
      'sources' => ['HR Payroll server', '192.168.0.0/16'],
      'destinations' => ['16.47.71.62'],
      'services' => ['HTTPS'],
    },
    'flow2' => {
      'sources' => ['10.0.0.1'],
      'destinations' => ['10.0.0.2'],
      'services' => ['udp/501'],
    },
    'flow3' => {
      'sources' => ['1.2.3.4'],
      'destinations' => ['3.4.5.6'],
      'services' => ['SSH'],
    }
  )
  action :define
end
```

## Testing

For more details look at the [TESTING.md](./TESTING.md).

All static code tests are simply run by:
```
bundle exec rake
```

To actually test the code, please refer to the `examples/README.md` file and apply against a
 TEST app in your AlgoSec Demo VM machine. 

## Resources

TODO: Document the ApplicationsFlow resource and it's define action

## License & Authors

If you would like to see the detailed LICENCE click [here](./LICENSE).

- Author:: AlgoSec <dev@algosec.com>