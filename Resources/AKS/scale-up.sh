#/bin/bash

# Licensed to IzzyAcademy.com under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# IzzyAcademy.com licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Defines the ARM template file location
export templateFile="aks-cluster-template.json"

# Defines the parameters that will be used in the ARM template
export parameterFile="aks-cluster-parameters.json"

# Defines the name of the Resource Group our resources are deployed into
export resourceGroupName="RealtimePractice"

export clusterName="realtimepractice"

export numNodes=5

# Scale the User Node Pool Manually to 5 nodes
# You can use this to scale up the user node pools
az aks nodepool scale --resource-group $resourceGroupName --cluster-name $clusterName --name userpool --node-count $numNodes --no-wait
