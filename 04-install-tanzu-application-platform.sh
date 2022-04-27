#in A-Secrets.sh
# export INSTALL_REGISTRY_USERNAME=TANZU-NET-USER
# export INSTALL_REGISTRY_PASSWORD=TANZU-NET-PASSWORD
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
export TAP_VERSION=1.1.0

#Create a namespace called tap-install for deploying any component packages
kubectl create ns tap-install

# Create a registry secret
tanzu secret registry add tap-registry \
  --username ${INSTALL_REGISTRY_USERNAME} --password ${INSTALL_REGISTRY_PASSWORD} \
  --server ${INSTALL_REGISTRY_HOSTNAME} \
  --export-to-all-namespaces --yes --namespace tap-install

#Warning: By choosing --export-to-all-namespaces, given secret contents will be available to ALL users in ALL namespaces. Please ensure that included registry credentials allow only read-only access to the registry with minimal necessary scope.
#Adding registry secret 'tap-registry'... 
#Added registry secret 'tap-registry' into namespace 'tap-install'
#Exported registry secret 'tap-registry' to all namespaces

kubectl get secrets -n tap-install

# NAME                           TYPE                                  DATA   AGE
# default-token-27rnb            kubernetes.io/service-account-token   3      2m38s
# tanzu-tap-repository-fetch-0   kubernetes.io/dockerconfigjson        1      102s
# tap-registry                   kubernetes.io/dockerconfigjson        1      2m2s

kubectl get secretexports.secretgen.carvel.dev -n tap-install

# NAME           DESCRIPTION           AGE
# tap-registry   Reconcile succeeded   3m21s

kubectl get secretexports.secretgen.carvel.dev -n tap-install -o yaml

# apiVersion: v1
# items:
# - apiVersion: secretgen.carvel.dev/v1alpha1
#   kind: SecretExport
#   metadata:
#     creationTimestamp: "2022-04-20T09:41:10Z"
#     generation: 1
#     name: tap-registry
#     namespace: tap-install
#     resourceVersion: "4000"
#     uid: bb21b46c-4221-4fbf-b73b-429d5f404f1a
#   spec:
#     toNamespaces:
#     - '*'
#   status:
#     conditions:
#     - status: "True"
#       type: ReconcileSucceeded
#     friendlyDescription: Reconcile succeeded
#     observedGeneration: 1
#     observedSecretResourceVersion: "3998"
# kind: List
# metadata:
#   resourceVersion: ""
#   selfLink: ""

# Add Tanzu Application Platform package repository to the cluster 
tanzu package repository add tanzu-tap-repository \
  --url registry.tanzu.vmware.com/tanzu-application-platform/tap-packages:$TAP_VERSION \
  --namespace tap-install

# | Adding package repository 'tanzu-tap-repository' 
# | Validating provided settings for the package repository 
# | Creating package repository resource 
# - Waiting for 'PackageRepository' reconciliation for 'tanzu-tap-repository' 
# | 'PackageRepository' resource install status: Reconciling 

# Added package repository 'tanzu-tap-repository' in namespace 'tap-install'

#Get the status of the Tanzu Application Platform package repository, and verify that it is ready

tanzu package repository list --namespace tap-install

# - Retrieving repositories... 
#   NAME                  REPOSITORY                                                         TAG    STATUS               DETAILS  
#   tanzu-tap-repository  registry.tanzu.vmware.com/tanzu-application-platform/tap-packages  1.1.0  Reconcile succeeded   

tanzu package repository get tanzu-tap-repository --namespace tap-install
# \ Retrieving repository tanzu-tap-repository... 
# NAME:          tanzu-tap-repository
# VERSION:       7887
# REPOSITORY:    registry.tanzu.vmware.com/tanzu-application-platform/tap-packages
# TAG:           1.1.0
# STATUS:        Reconcile succeeded
# REASON:    


kubectl describe packagerepositories.packaging.carvel.dev -n tap-install

# List the available packages
tanzu package available list --namespace tap-install

# | Retrieving available packages...
#   NAME                                                 DISPLAY-NAME                                                              SHORT-DESCRIPTION                                                                                                                                              LATEST-VERSION
#   accelerator.apps.tanzu.vmware.com                    Application Accelerator for VMware Tanzu                                  Used to create new projects and configurations.                                                                                                                1.1.2
#   api-portal.tanzu.vmware.com                          API portal                                                                A unified user interface to enable search, discovery and try-out of API endpoints at ease.                                                                     1.0.15
#   backend.appliveview.tanzu.vmware.com                 Application Live View for VMware Tanzu                                    App for monitoring and troubleshooting running apps                                                                                                            1.1.0
#   build.appliveview.tanzu.vmware.com                   Application Live View Conventions for VMware Tanzu                        Application Live View convention server                                                                                                                        1.0.2
#   buildservice.tanzu.vmware.com                        Tanzu Build Service                                                       Tanzu Build Service enables the building and automation of containerized software workflows securely and at scale.                                             1.5.0
#   cartographer.tanzu.vmware.com                        Cartographer                                                              Kubernetes native Supply Chain Choreographer.                                                                                                                  0.3.0
#   cnrs.tanzu.vmware.com                                Cloud Native Runtimes                                                     Cloud Native Runtimes is a serverless runtime based on Knative                                                                                                 1.2.0
#   connector.appliveview.tanzu.vmware.com               Application Live View Connector for VMware Tanzu                          App for discovering and registering running apps                                                                                                               1.1.0
#   controller.conventions.apps.tanzu.vmware.com         Convention Service for VMware Tanzu                                       Convention Service enables app operators to consistently apply desired runtime configurations to fleets of workloads.                                          0.6.3
#   controller.source.apps.tanzu.vmware.com              Tanzu Source Controller                                                   Tanzu Source Controller enables workload create/update from source code.                                                                                       0.3.3
#   conventions.appliveview.tanzu.vmware.com             Application Live View Conventions for VMware Tanzu                        Application Live View convention server                                                                                                                        1.1.0
#   developer-conventions.tanzu.vmware.com               Tanzu App Platform Developer Conventions                                  Developer Conventions                                                                                                                                          0.6.0
#   fluxcd.source.controller.tanzu.vmware.com            Flux Source Controller                                                    The source-controller is a Kubernetes operator, specialised in artifacts acquisition from external sources such as Git, Helm repositories and S3 buckets.      0.16.4
#   grype.scanning.apps.tanzu.vmware.com                 Grype for Supply Chain Security Tools - Scan                              Default scan templates using Anchore Grype                                                                                                                     1.1.0
#   image-policy-webhook.signing.apps.tanzu.vmware.com   Image Policy Webhook                                                      Image Policy Webhook enables defining of a policy to restrict unsigned container images.                                                                       1.1.1
#   learningcenter.tanzu.vmware.com                      Learning Center for Tanzu Application Platform                            Guided technical workshops                                                                                                                                     0.2.0
#   metadata-store.apps.tanzu.vmware.com                 Supply Chain Security Tools - Store                                       Post SBoMs and query for image, package, and vulnerability metadata.                                                                                           1.1.2
#   ootb-delivery-basic.tanzu.vmware.com                 Tanzu App Platform Out of The Box Delivery Basic                          Out of The Box Delivery Basic.                                                                                                                                 0.7.0
#   ootb-supply-chain-basic.tanzu.vmware.com             Tanzu App Platform Out of The Box Supply Chain Basic                      Out of The Box Supply Chain Basic.                                                                                                                             0.7.0
#   ootb-supply-chain-testing-scanning.tanzu.vmware.com  Tanzu App Platform Out of The Box Supply Chain with Testing and Scanning  Out of The Box Supply Chain with Testing and Scanning.                                                                                                         0.7.0
#   ootb-supply-chain-testing.tanzu.vmware.com           Tanzu App Platform Out of The Box Supply Chain with Testing               Out of The Box Supply Chain with Testing.                                                                                                                      0.7.0
#   ootb-templates.tanzu.vmware.com                      Tanzu App Platform Out of The Box Templates                               Out of The Box Templates.                                                                                                                                      0.7.0
#   run.appliveview.tanzu.vmware.com                     Application Live View for VMware Tanzu                                    App for monitoring and troubleshooting running apps                                                                                                            1.0.3
#   scanning.apps.tanzu.vmware.com                       Supply Chain Security Tools - Scan                                        Scan for vulnerabilities and enforce policies directly within Kubernetes native Supply Chains.                                                                 1.1.0
#   service-bindings.labs.vmware.com                     Service Bindings for Kubernetes                                           Service Bindings for Kubernetes implements the Service Binding Specification.                                                                                  0.7.1
#   services-toolkit.tanzu.vmware.com                    Services Toolkit                                                          The Services Toolkit enables the management, lifecycle, discoverability and connectivity of Service Resources (databases, message queues, DNS records, etc.).  0.6.0
#   spring-boot-conventions.tanzu.vmware.com             Tanzu Spring Boot Conventions Server                                      Default Spring Boot convention server.                                                                                                                         0.4.0
#   tap-auth.tanzu.vmware.com                            Default roles for Tanzu Application Platform                              Default roles for Tanzu Application Platform                                                                                                                   1.0.1
#   tap-gui.tanzu.vmware.com                             Tanzu Application Platform GUI                                            web app graphical user interface for Tanzu Application Platform                                                                                                1.1.0
#   tap-telemetry.tanzu.vmware.com                       Telemetry Collector for Tanzu Application Platform                        Tanzu Application Plaform Telemetry                                                                                                                            0.1.4
#   tap.tanzu.vmware.com                                 Tanzu Application Platform                                                Package to install a set of TAP components to get you started based on your use case.                                                                          1.1.0
#   tekton.tanzu.vmware.com                              Tekton Pipelines                                                          Tekton Pipelines is a framework for creating CI/CD systems.                                                                                                    0.33.2
#   workshops.learningcenter.tanzu.vmware.com            Workshop Building Tutorial                                                Workshop Building Tutorial                                                                                                                                     0.2.0

# https://docs.vmware.com/en/Tanzu-Application-Platform/1.0/tap/GUID-getting-started.html
#https://docs.vmware.com/en/Tanzu-Application-Platform/1.0/tap/GUID-install.html --> Step 6


tanzu package install tap -p tap.tanzu.vmware.com -v $TAP_VERSION --values-file tap-values-basic.yaml -n tap-install

tanzu package install tap -p tap.tanzu.vmware.com -v $TAP_VERSION --values-file tap-values-exclude-all.yaml -n tap-install

# / Installing package 'tap.tanzu.vmware.com' I0420 18:16:34.441607   27523 request.go:665] Waited for 1.014636636s due to client-side throttling, not priority and fairness, request: GET:https://tap11-clstr-dns-e828b040.hcp.australiaeast.azmk8s.io:443/apis/networking.internal.knative.dev/v1alpha1?timeout=32s
# \ Installing package 'tap.tanzu.vmware.com' 

# | Getting package install for 'tap' 
# - Getting package metadata for 'tap.tanzu.vmware.com' 
# | Updating secret 'tap-tap-install-values' 
# | Updating package install for 'tap' 
# - Waiting for 'PackageInstall' reconciliation for 'tap' 



# Updated installed package 'tap'

kubectl get packageinstalls -n tap-install

# NAME                      PACKAGE NAME                                         PACKAGE VERSION   DESCRIPTION                                                         AGE
# accelerator               accelerator.apps.tanzu.vmware.com                    1.1.2             Reconcile succeeded                                                 25m
# api-portal                api-portal.tanzu.vmware.com                          1.0.15            Reconcile succeeded                                                 45m
# appliveview               backend.appliveview.tanzu.vmware.com                 1.1.0             Reconcile succeeded                                                 69m
# appliveview-connector     connector.appliveview.tanzu.vmware.com               1.1.0             Reconcile succeeded                                                 69m
# appliveview-conventions   conventions.appliveview.tanzu.vmware.com             1.1.0             Reconcile succeeded                                                 69m
# buildservice              buildservice.tanzu.vmware.com                        1.5.0             Reconcile succeeded                                                 45m
# cartographer              cartographer.tanzu.vmware.com                        0.3.0             Deleting                                                            35m
# cert-manager              cert-manager.tanzu.vmware.com                        1.5.3+tap.2       Deleting                                                            45m
# cnrs                      cnrs.tanzu.vmware.com                                1.2.0             Reconcile succeeded                                                 25m
# contour                   contour.tanzu.vmware.com                             1.18.2+tap.2      Deleting                                                            35m
# image-policy-webhook      image-policy-webhook.signing.apps.tanzu.vmware.com   1.1.1             Reconcile succeeded                                                 35m
# learningcenter            learningcenter.tanzu.vmware.com                      0.2.0             Deleting                                                            25m
# metadata-store            metadata-store.apps.tanzu.vmware.com                 1.1.2             Deleting                                                            35m
# ootb-delivery-basic       ootb-delivery-basic.tanzu.vmware.com                 0.7.0             Reconcile succeeded                                                 25m
# service-bindings          service-bindings.labs.vmware.com                     0.7.1             Deleting                                                            45m
# services-toolkit          services-toolkit.tanzu.vmware.com                    0.6.0             Delete failed: Error (see .status.usefulErrorMessage for details)   45m
# spring-boot-conventions   spring-boot-conventions.tanzu.vmware.com             0.4.0             Deleting                                                            25m
# tap                       tap.tanzu.vmware.com                                 1.1.0             Reconciling                                                         73m
# tap-auth                  tap-auth.tanzu.vmware.com                            1.0.1             Reconcile succeeded                                                 69m
# tap-gui                   tap-gui.tanzu.vmware.com                             1.1.0             Reconcile succeeded                                                 25m
# tap-telemetry             tap-telemetry.tanzu.vmware.com                       0.1.4             Reconcile succeeded                                                 69m
# tekton-pipelines          tekton.tanzu.vmware.com                              0.33.2            Deleting                            

# NAME                      PACKAGE NAME                               PACKAGE VERSION   DESCRIPTION                                                            AGE
# appliveview               backend.appliveview.tanzu.vmware.com       1.1.0             Reconcile succeeded                                                    71m
# appliveview-connector     connector.appliveview.tanzu.vmware.com     1.1.0             Reconcile succeeded                                                    71m
# appliveview-conventions   conventions.appliveview.tanzu.vmware.com   1.1.0             Reconcile failed: Error (see .status.usefulErrorMessage for details)   71m
# cnrs                      cnrs.tanzu.vmware.com                      1.2.0             Deleting                                                               27m
# contour                   contour.tanzu.vmware.com                   1.18.2+tap.2      Deleting                                                               37m
# tap                       tap.tanzu.vmware.com                       1.1.0             Reconciling                                                            75m
# tap-auth                  tap-auth.tanzu.vmware.com                  1.0.1             Reconcile succeeded                                                    71m
# tap-telemetry             tap-telemetry.tanzu.vmware.com             0.1.4             Reconcile succeeded                                                    71m


# NAME                      PACKAGE NAME                               PACKAGE VERSION   DESCRIPTION                                                            AGE
# appliveview               backend.appliveview.tanzu.vmware.com       1.1.0             Reconcile succeeded                                                    74m
# appliveview-connector     connector.appliveview.tanzu.vmware.com     1.1.0             Reconcile succeeded                                                    74m
# appliveview-conventions   conventions.appliveview.tanzu.vmware.com   1.1.0             Reconcile failed: Error (see .status.usefulErrorMessage for details)   74m
# tap                       tap.tanzu.vmware.com                       1.1.0             Reconcile succeeded                                                    79m
# tap-auth                  tap-auth.tanzu.vmware.com                  1.0.1             Reconcile succeeded                                                    74m
# tap-telemetry             tap-telemetry.tanzu.vmware.com             0.1.4             Reconcile succeeded                                                    74m

tanzu package installed get appliveview-conventions -n tap-install

# \ Retrieving installation details for appliveview-conventions... 
# NAME:                    appliveview-conventions
# PACKAGE-NAME:            conventions.appliveview.tanzu.vmware.com
# PACKAGE-VERSION:         1.1.0
# STATUS:                  Reconcile failed: Error (see .status.usefulErrorMessage for details)
# CONDITIONS:              [{ReconcileFailed True  Error (see .status.usefulErrorMessage for details)}]
# USEFUL-ERROR-MESSAGE:    kapp: Error: Expected to find kind 'cert-manager.io/v1/Issuer', but did not:
# - Kubernetes API server did not have matching apiVersion + kind
# - No matching CRD was found in given configuration

kubectl get pods -o wide  -A
# NAMESPACE                   NAME                                            READY   STATUS    RESTARTS   AGE    IP            NODE                                NOMINATED NODE   READINESS GATES
# app-live-view-connector     application-live-view-connector-n8n6k           1/1     Running   0          79m    10.244.0.14   aks-agentpool-64024582-vmss000001   <none>           <none>
# app-live-view-conventions   appliveview-webhook-74fcb48bb4-hpt4l            1/1     Running   0          40m    10.244.0.44   aks-agentpool-64024582-vmss000001   <none>           <none>
# app-live-view               application-live-view-server-56ddf5f4d5-jgh8v   1/1     Running   0          79m    10.244.0.12   aks-agentpool-64024582-vmss000001   <none>           <none>
# kapp-controller             kapp-controller-775d6684c5-n8xsl                1/1     Running   0          119m   10.244.0.10   aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 aks-link-7c4499549c-cl6qb                       1/1     Running   0          136m   10.244.0.6    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 aks-link-7c4499549c-f5ms9                       1/1     Running   0          136m   10.244.0.4    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 azure-ip-masq-agent-t5xkb                       1/1     Running   0          135m   10.240.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 cloud-node-manager-967vf                        1/1     Running   0          135m   10.240.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 coredns-69c47794-9lqgw                          1/1     Running   0          136m   10.244.0.3    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 coredns-69c47794-hwsr7                          1/1     Running   0          134m   10.244.0.9    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 coredns-autoscaler-7d56cd888-54nr9              1/1     Running   0          136m   10.244.0.8    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 csi-azuredisk-node-t6hjn                        3/3     Running   0          135m   10.240.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 csi-azurefile-node-2kmkw                        3/3     Running   0          135m   10.240.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 kube-proxy-jvdst                                1/1     Running   0          135m   10.240.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 metrics-server-6576d9ccf8-vtpqf                 1/1     Running   0          136m   10.244.0.7    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 omsagent-9ltg2                                  2/2     Running   0          135m   10.244.0.2    aks-agentpool-64024582-vmss000001   <none>           <none>
# kube-system                 omsagent-rs-65ffdb496-sf292                     1/1     Running   0          136m   10.244.0.5    aks-agentpool-64024582-vmss000001   <none>           <none>
# secretgen-controller        secretgen-controller-65757cfbc4-g2zwq           1/1     Running   0          119m   10.244.0.11   aks-agentpool-64024582-vmss000001   <none>           <none>
# tap-telemetry               tap-telemetry-controller-77b76545f6-2xrfn       1/1     Running   0          79m    10.244.0.13   aks-agentpool-64024582-vmss000001   <none>           <none>

tanzu package install tap -p tap.tanzu.vmware.com -v $TAP_VERSION --values-file tap-values-basic.yaml -n tap-install


tanzu package installed get tap -n tap-install

tanzu package install tap -p tap.tanzu.vmware.com -v $TAP_VERSION --values-file tap-values.yaml -n tap-install