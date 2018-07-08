#
# Cookbook:: my_algosec
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Replace these credentials with those of your AlgoSec(s)
    algosec = { host: 'local.algosec.com', user: 'admin', password: 'algosec', ssl_enabled: false }

    algosec_application_flows 'define new application flows' do
      algosec_options algosec
      application_name 'testApp'
      application_flows(
        'flow1' => {
          'sources' => ['HR Payroll server', '192.168.0.0/16'],
          'destinations' => ['16.47.71.62'],
          'services' => ['HTTPS']
        },
        'flow2' => {
          'sources' => ['10.0.0.1'],
          'destinations' => ['10.0.0.2'],
          'services' => ['udp/501']
        },
        'flow3' => {
          'sources' => ['1.2.3.4'],
          'destinations' => ['3.4.5.6'],
          'services' => ['SSH']
        }
      )
  end
