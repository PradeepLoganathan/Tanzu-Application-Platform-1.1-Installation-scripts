export CLUSTER_NAME=tap-demo
export LOCATION=australiaeast

az login
az group create --location ${LOCATION} --name ${CLUSTER_NAME}

# for preview features
az extension add --name aks-preview

# Update the extension to make sure you have the latest version installed
az extension update --name aks-preview

az feature register --name PodSecurityPolicyPreview --namespace Microsoft.ContainerService
###az feature register --name ManagedIdentityPreview --namespace Microsoft.ContainerService

# Wait until the status is "Registered"
az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/PodSecurityPolicyPreview')].{Name:name,State:properties.state}"

az provider register --namespace Microsoft.ContainerService

az provider show -n Microsoft.ContainerService

#check your quotas before this. I needed to have 32 cores in the region I chose for DSV2.
az aks create --resource-group ${CLUSTER_NAME} --name ${CLUSTER_NAME} --node-count 4 --enable-addons monitoring --node-vm-size Standard_DS3_v2 --node-osdisk-size 500 --enable-pod-security-policy
# The behavior of this command has been altered by the following extension: aks-preview
# AAD role propagation done[############################################]  100.0000%{
#   "aadProfile": null,
#   "addonProfiles": {
#     "omsagent": {
#       "config": {
#         "logAnalyticsWorkspaceResourceID": "/subscriptions/<<subscriptionid>>/resourceGroups/DefaultResourceGroup-EAU/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-<<subscriptionid>>-EAU",
#         "useAADAuth": "False"
#       },
#       "enabled": true,
#       "identity": {
#         "clientId": "8c1d19fb-02ab-4e86-8184-fb65b1477c01",
#         "objectId": "db2729df-09b2-4f65-8efa-54bc500e8ae1",
#         "resourceId": "/subscriptions/<<subscriptionid>>/resourcegroups/MC_tap-demo_tap-demo_australiaeast/providers/Microsoft.ManagedIdentity/userAssignedIdentities/omsagent-tap-demo"
#       }
#     }
#   },
#   "agentPoolProfiles": [
#     {
#       "availabilityZones": null,
#       "capacityReservationGroupId": null,
#       "count": 4,
#       "creationData": null,
#       "enableAutoScaling": false,
#       "enableEncryptionAtHost": false,
#       "enableFips": false,
#       "enableNodePublicIp": false,
#       "enableUltraSsd": false,
#       "gpuInstanceProfile": null,
#       "hostGroupId": null,
#       "kubeletConfig": null,
#       "kubeletDiskType": "OS",
#       "linuxOsConfig": null,
#       "maxCount": null,
#       "maxPods": 110,
#       "messageOfTheDay": null,
#       "minCount": null,
#       "mode": "System",
#       "name": "nodepool1",
#       "nodeImageVersion": "AKSUbuntu-1804gen2containerd-2022.02.01",
#       "nodeLabels": null,
#       "nodePublicIpPrefixId": null,
#       "nodeTaints": null,
#       "orchestratorVersion": "1.21.9",
#       "osDiskSizeGb": 500,
#       "osDiskType": "Managed",
#       "osSku": "Ubuntu",
#       "osType": "Linux",
#       "podSubnetId": null,
#       "powerState": {
#         "code": "Running"
#       },
#       "provisioningState": "Succeeded",
#       "proximityPlacementGroupId": null,
#       "scaleDownMode": null,
#       "scaleSetEvictionPolicy": null,
#       "scaleSetPriority": null,
#       "spotMaxPrice": null,
#       "tags": null,
#       "type": "VirtualMachineScaleSets",
#       "upgradeSettings": null,
#       "vmSize": "Standard_DS3_v2",
#       "vnetSubnetId": null,
#       "workloadRuntime": "OCIContainer"
#     }
#   ],
#   "apiServerAccessProfile": null,
#   "autoScalerProfile": null,
#   "autoUpgradeProfile": null,
#   "azurePortalFqdn": "tap-demo-tap-demo-d084e8-88703c72.portal.hcp.australiaeast.azmk8s.io",
#   "currentKubernetesVersion": "1.21.9",
#   "disableLocalAccounts": false,
#   "diskEncryptionSetId": null,
#   "dnsPrefix": "tap-demo-tap-demo-d084e8",
#   "enableNamespaceResources": null,
#   "enablePodSecurityPolicy": true,
#   "enableRbac": true,
#   "extendedLocation": null,
#   "fqdn": "tap-demo-tap-demo-d084e8-88703c72.hcp.australiaeast.azmk8s.io",
#   "fqdnSubdomain": null,
#   "httpProxyConfig": null,
#   "id": "/subscriptions/<<subscriptionid>>/resourcegroups/tap-demo/providers/Microsoft.ContainerService/managedClusters/tap-demo",
#   "identity": {
#     "principalId": "32e952f1-bd19-45ae-a845-e15ba27532fc",
#     "tenantId": "b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0",
#     "type": "SystemAssigned",
#     "userAssignedIdentities": null
#   },
#   "identityProfile": {
#     "kubeletidentity": {
#       "clientId": "<<clientid>>",
#       "objectId": "f198a718-0350-4153-809f-5b63ee731620",
#       "resourceId": "/subscriptions/<<subscriptionid>>/resourcegroups/MC_tap-demo_tap-demo_australiaeast/providers/Microsoft.ManagedIdentity/userAssignedIdentities/tap-demo-agentpool"
#     }
#   },
#   "kubernetesVersion": "1.21.9",
#   "linuxProfile": {
#     "adminUsername": "azureuser",
#     "ssh": {
#       "publicKeys": [
#         {
#           "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXycEfFRbKFoYQ35DjWCY3vK2qo0cWehSAnHokBIU7mOrYSNR6IVl47KPf/dOTj+mGStatry3iBkcf3dJP0dFTXqpPFJk5gDOHDo2zbIPQrGVHnR64eOst8XN/SwV6R51t328xyci4IFgxKGUPxl11BlLv4j9Paks+n09g2IQYGZvL8KJr6q/WIQMVeemHy8EykM+vvjSfkRjbZNXb5mjQQrK4oyhRELojX9q2Rn7kGzy3uffaS0oFoyhmMLw0lprKY3CN3P2b1stkSc/4Ff/2aExw+GsOXruPHR8mI2VQmliHTUBV/X6LPGDFAnlrXYM09qVSluacIoFi0GvArvZc1OnqMRVANuAS0etTpoWbOtxX8BQEpdp2+12a4xCIIQQdY7e4st8ui8yuhTo1zGb8/PWa17u8CfvU2lSXaopqowvtVJfya1YE2d9iaOxMoXpxGMZ5OILTgOiI68OM9GpYW/9r20L+8y529vsMkUB5/jp85pnnQXms+U48Wg8yEwszPFze+t6QVAsXoBJkEZkuvGxPjobZcpUAfCTiHEP66hIy0uDybDhJn37YDdnuNbnvltoy2Fr9mP5+hDGxh7GcU2AVro8Jp1QE8PjDbyKK1pYbz5telgTF03Knp2pjKsOObywAhq3Q/fv9LtyBswKLXtOMKCT2S2Yp6LFP/7zBtQ== email@example.com\n"
#         }
#       ]
#     }
#   },
#   "location": "australiaeast",
#   "maxAgentPools": 100,
#   "name": "tap-demo",
#   "networkProfile": {
#     "dnsServiceIp": "12.12.34.12",
#     "dockerBridgeCidr": "134.13.0.1/16",
#     "ipFamilies": [
#       "IPv4"
#     ],
#     "loadBalancerProfile": {
#       "allocatedOutboundPorts": null,
#       "effectiveOutboundIPs": [
#         {
#           "id": "/subscriptions/<<subscriptionid>>/resourceGroups/MC_tap-demo_tap-demo_australiaeast/providers/Microsoft.Network/publicIPAddresses/682c4707-e904-43e3-b583-bfef244cf01f",
#           "resourceGroup": "MC_tap-demo_tap-demo_australiaeast"
#         }
#       ],
#       "enableMultipleStandardLoadBalancers": null,
#       "idleTimeoutInMinutes": null,
#       "managedOutboundIPs": {
#         "count": 1,
#         "countIpv6": null
#       },
#       "outboundIPs": null,
#       "outboundIpPrefixes": null
#     },
#     "loadBalancerSku": "Standard",
#     "natGatewayProfile": null,
#     "networkMode": null,
#     "networkPlugin": "kubenet",
#     "networkPolicy": null,
#     "outboundType": "loadBalancer",
#     "podCidr": "10.244.0.0/16",
#     "podCidrs": [
#       "10.244.0.0/16"
#     ],
#     "serviceCidr": "10.0.0.0/16",
#     "serviceCidrs": [
#       "10.0.0.0/16"
#     ]
#   },
#   "nodeResourceGroup": "MC_tap-demo_tap-demo_australiaeast",
#   "oidcIssuerProfile": {
#     "enabled": false,
#     "issuerUrl": null
#   },
#   "podIdentityProfile": null,
#   "powerState": {
#     "code": "Running"
#   },
#   "privateFqdn": null,
#   "privateLinkResources": null,
#   "provisioningState": "Succeeded",
#   "publicNetworkAccess": null,
#   "resourceGroup": "tap-demo",
#   "securityProfile": null,
#   "servicePrincipalProfile": {
#     "clientId": "msi",
#     "secret": null
#   },
#   "sku": {
#     "name": "Basic",
#     "tier": "Free"
#   },
#   "tags": null,
#   "type": "Microsoft.ContainerService/ManagedClusters",
#   "windowsProfile": null
# }

az aks get-credentials --resource-group ${CLUSTER_NAME} --name ${CLUSTER_NAME}

kubectl create clusterrolebinding tap-psp-rolebinding --group=system:authenticated --clusterrole=psp:privileged
# clusterrolebinding.rbac.authorization.k8s.io/tap-psp-rolebinding created