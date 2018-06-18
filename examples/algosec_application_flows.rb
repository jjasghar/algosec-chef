# frozen_string_literal: true

# (c) Copyright 2018 AlgoSec Systems
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

# Managing AlgoSec Application flows

# Define the connection info for your AlgoSec server
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
  action :define
end
