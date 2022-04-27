export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:ab0a3539da241a6ea59c75c0743e9058511d7c56312ea3906178ec0f3491f51d
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
export INSTALL_REGISTRY_USERNAME= "<<userid>>"
export INSTALL_REGISTRY_PASSWORD= "<<password>>"


export INSTALL_BUNDLE=registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:ab0a3539da241a6ea59c75c0743e9058511d7c56312ea3906178ec0f3491f51d
export INSTALL_REGISTRY_HOSTNAME=registry.tanzu.vmware.com
export INSTALL_REGISTRY_USERNAME=<<userid>>
export INSTALL_REGISTRY_PASSWORD=<<password>>
cd $HOME/tanzu-cluster-essentials
./install.sh --yes


mkdir $HOME/tanzu-cluster-essentials

tar -xvf $HOME/downloads/tanzu-cluster-essentials-linux-amd64-1.1.0.tgz -C $HOME/tanzu-cluster-essentials

cd $HOME/tanzu-cluster-essentials

./install.sh

# ## Creating namespace tanzu-cluster-essentials
# ## Pulling bundle from registry.tanzu.vmware.com (username: <<userid>>)
# Pulling bundle 'registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:82dfaf70656b54dcba0d4def85ccae1578ff27054e7533d08320244af7fb0343'
#   Extracting layer 'sha256:145f7570038b43f5a84ad43908dd6162f00e45210f172b9f27374d7f4f063005' (1/1)

# Locating image lock file images...
# The bundle repo (registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle) is hosting every image specified in the bundle's Images Lock file (.imgpkg/images.yml)

# Succeeded
# ## Deploying kapp-controller
# resolve | final: ghcr.io/vmware-tanzu/carvel-kapp-controller@sha256:46f9c4e78d80a322ae3159cb97069350b445b974664f4aead0ab4ad593d79f45 -> registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:e4cfadd453f7d452654c6074878ad454d3dbff4e4a9ab537b461fedf46c62672
# Target cluster 'https://tap-demo-tap-demo-d084e8-88703c72.hcp.australiaeast.azmk8s.io:443' (nodes: aks-nodepool1-23297293-vmss000002, 3+)

# Changes

# Namespace        Name                                                    Kind                      Conds.  Age  Op      Op st.  Wait to    Rs  Ri  
# (cluster)        apps.kappctrl.k14s.io                                   CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                internalpackagemetadatas.internal.packaging.carvel.dev  CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                internalpackages.internal.packaging.carvel.dev          CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                kapp-controller                                         Namespace                 -       -    create  -       reconcile  -   -  
# ^                kapp-controller-cluster-role                            ClusterRole               -       -    create  -       reconcile  -   -  
# ^                kapp-controller-cluster-role-binding                    ClusterRoleBinding        -       -    create  -       reconcile  -   -  
# ^                packageinstalls.packaging.carvel.dev                    CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                packagerepositories.packaging.carvel.dev                CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                pkg-apiserver:system:auth-delegator                     ClusterRoleBinding        -       -    create  -       reconcile  -   -  
# ^                tanzu-package-repo-global                               Namespace                 -       -    create  -       reconcile  -   -  
# ^                v1alpha1.data.packaging.carvel.dev                      APIService                -       -    create  -       reconcile  -   -  
# kapp-controller  kapp-controller                                         Deployment                -       -    create  -       reconcile  -   -  
# ^                kapp-controller-config                                  ConfigMap                 -       -    create  -       reconcile  -   -  
# ^                kapp-controller-registry-creds                          Secret                    -       -    create  -       reconcile  -   -  
# ^                kapp-controller-sa                                      ServiceAccount            -       -    create  -       reconcile  -   -  
# ^                packaging-api                                           Service                   -       -    create  -       reconcile  -   -  
# kube-system      pkgserver-auth-reader                                   RoleBinding               -       -    create  -       reconcile  -   -  

# Op:      17 create, 0 delete, 0 update, 0 noop
# Wait to: 17 reconcile, 0 delete, 0 noop

# 2:04:52PM: ---- applying 12 changes [0/17 done] ----
# 2:04:52PM: create namespace/kapp-controller (v1) cluster
# 2:04:52PM: create rolebinding/pkgserver-auth-reader (rbac.authorization.k8s.io/v1) namespace: kube-system
# 2:04:52PM: create clusterrole/kapp-controller-cluster-role (rbac.authorization.k8s.io/v1) cluster
# 2:04:52PM: create clusterrolebinding/kapp-controller-cluster-role-binding (rbac.authorization.k8s.io/v1) cluster
# 2:04:52PM: create clusterrolebinding/pkg-apiserver:system:auth-delegator (rbac.authorization.k8s.io/v1) cluster
# 2:04:53PM: create namespace/tanzu-package-repo-global (v1) cluster
# 2:04:53PM: create apiservice/v1alpha1.data.packaging.carvel.dev (apiregistration.k8s.io/v1) cluster
# 2:04:53PM: create customresourcedefinition/packageinstalls.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:53PM: create customresourcedefinition/apps.kappctrl.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:04:53PM: create customresourcedefinition/packagerepositories.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:54PM: create customresourcedefinition/internalpackagemetadatas.internal.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:54PM: create customresourcedefinition/internalpackages.internal.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:54PM: ---- waiting on 12 changes [0/17 done] ----
# 2:04:54PM: ok: reconcile clusterrolebinding/pkg-apiserver:system:auth-delegator (rbac.authorization.k8s.io/v1) cluster
# 2:04:54PM: ok: reconcile customresourcedefinition/internalpackages.internal.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:54PM: ok: reconcile namespace/kapp-controller (v1) cluster
# 2:04:54PM: ok: reconcile clusterrole/kapp-controller-cluster-role (rbac.authorization.k8s.io/v1) cluster
# 2:04:54PM: ok: reconcile rolebinding/pkgserver-auth-reader (rbac.authorization.k8s.io/v1) namespace: kube-system
# 2:04:54PM: ok: reconcile clusterrolebinding/kapp-controller-cluster-role-binding (rbac.authorization.k8s.io/v1) cluster
# 2:04:54PM: ok: reconcile namespace/tanzu-package-repo-global (v1) cluster
# 2:04:54PM: ok: reconcile customresourcedefinition/packageinstalls.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:54PM: ongoing: reconcile apiservice/v1alpha1.data.packaging.carvel.dev (apiregistration.k8s.io/v1) cluster
# 2:04:54PM:  ^ Condition Available is not True (False)
# 2:04:55PM: ok: reconcile customresourcedefinition/packagerepositories.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:55PM: ok: reconcile customresourcedefinition/internalpackagemetadatas.internal.packaging.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:04:55PM: ok: reconcile customresourcedefinition/apps.kappctrl.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:04:55PM: ---- applying 3 changes [12/17 done] ----
# 2:04:55PM: create configmap/kapp-controller-config (v1) namespace: kapp-controller
# 2:04:55PM: create secret/kapp-controller-registry-creds (v1) namespace: kapp-controller
# 2:04:56PM: create serviceaccount/kapp-controller-sa (v1) namespace: kapp-controller
# 2:04:56PM: ---- waiting on 4 changes [11/17 done] ----
# 2:04:56PM: ok: reconcile serviceaccount/kapp-controller-sa (v1) namespace: kapp-controller
# 2:04:56PM: ok: reconcile configmap/kapp-controller-config (v1) namespace: kapp-controller
# 2:04:56PM: ok: reconcile secret/kapp-controller-registry-creds (v1) namespace: kapp-controller
# 2:04:56PM: ---- applying 2 changes [15/17 done] ----
# 2:04:56PM: create service/packaging-api (v1) namespace: kapp-controller
# 2:04:58PM: create deployment/kapp-controller (apps/v1) namespace: kapp-controller
# 2:04:58PM: ---- waiting on 3 changes [14/17 done] ----
# 2:04:58PM: ok: reconcile service/packaging-api (v1) namespace: kapp-controller
# 2:04:58PM: ongoing: reconcile deployment/kapp-controller (apps/v1) namespace: kapp-controller
# 2:04:58PM:  ^ Waiting for 1 unavailable replicas
# 2:04:58PM:  L ok: waiting on replicaset/kapp-controller-66f45b5768 (apps/v1) namespace: kapp-controller
# 2:04:58PM:  L ongoing: waiting on pod/kapp-controller-66f45b5768-2frv9 (v1) namespace: kapp-controller
# 2:04:58PM:     ^ Pending: ContainerCreating
# 2:04:58PM: ---- waiting on 2 changes [15/17 done] ----
# 2:05:45PM: ok: reconcile deployment/kapp-controller (apps/v1) namespace: kapp-controller
# 2:05:45PM: ---- waiting on 1 changes [16/17 done] ----
# 2:05:48PM: ok: reconcile apiservice/v1alpha1.data.packaging.carvel.dev (apiregistration.k8s.io/v1) cluster
# 2:05:48PM: ---- applying complete [17/17 done] ----
# 2:05:48PM: ---- waiting complete [17/17 done] ----

# Succeeded
# ## Deploying secretgen-controller
# resolve | final: ghcr.io/vmware-tanzu/carvel-secretgen-controller@sha256:883d6312b37597b6b65cf6ec7f2e70137a17f0c8e27211b60f3f3c3764ee7a3d -> registry.tanzu.vmware.com/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:509874b6b3d40a61144a54d5a3fb40603257a6297dcc9ac8f47e24c665b3e20d
# Target cluster 'https://tap-demo-tap-demo-d084e8-88703c72.hcp.australiaeast.azmk8s.io:443' (nodes: aks-nodepool1-23297293-vmss000002, 3+)

# Changes

# Namespace             Name                                       Kind                      Conds.  Age  Op      Op st.  Wait to    Rs  Ri  
# (cluster)             certificates.secretgen.k14s.io             CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                     passwords.secretgen.k14s.io                CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                     rsakeys.secretgen.k14s.io                  CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                     secretexports.secretgen.carvel.dev         CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                     secretgen-controller                       Namespace                 -       -    create  -       reconcile  -   -  
# ^                     secretgen-controller-cluster-role          ClusterRole               -       -    create  -       reconcile  -   -  
# ^                     secretgen-controller-cluster-role-binding  ClusterRoleBinding        -       -    create  -       reconcile  -   -  
# ^                     secretimports.secretgen.carvel.dev         CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# ^                     sshkeys.secretgen.k14s.io                  CustomResourceDefinition  -       -    create  -       reconcile  -   -  
# secretgen-controller  secretgen-controller                       Deployment                -       -    create  -       reconcile  -   -  
# ^                     secretgen-controller-registry-creds        Secret                    -       -    create  -       reconcile  -   -  
# ^                     secretgen-controller-sa                    ServiceAccount            -       -    create  -       reconcile  -   -  

# Op:      12 create, 0 delete, 0 update, 0 noop
# Wait to: 12 reconcile, 0 delete, 0 noop

# 2:05:50PM: ---- applying 9 changes [0/12 done] ----
# 2:05:50PM: create clusterrolebinding/secretgen-controller-cluster-role-binding (rbac.authorization.k8s.io/v1) cluster
# 2:05:51PM: create customresourcedefinition/secretimports.secretgen.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:05:52PM: create customresourcedefinition/rsakeys.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:52PM: create customresourcedefinition/secretexports.secretgen.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:05:52PM: create customresourcedefinition/passwords.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:52PM: create namespace/secretgen-controller (v1) cluster
# 2:05:52PM: create customresourcedefinition/certificates.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:52PM: create clusterrole/secretgen-controller-cluster-role (rbac.authorization.k8s.io/v1) cluster
# 2:05:53PM: create customresourcedefinition/sshkeys.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ---- waiting on 9 changes [0/12 done] ----
# 2:05:53PM: ok: reconcile customresourcedefinition/secretexports.secretgen.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile customresourcedefinition/secretimports.secretgen.carvel.dev (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile customresourcedefinition/sshkeys.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile customresourcedefinition/passwords.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile customresourcedefinition/certificates.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile clusterrole/secretgen-controller-cluster-role (rbac.authorization.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile clusterrolebinding/secretgen-controller-cluster-role-binding (rbac.authorization.k8s.io/v1) cluster
# 2:05:53PM: ok: reconcile namespace/secretgen-controller (v1) cluster
# 2:05:53PM: ok: reconcile customresourcedefinition/rsakeys.secretgen.k14s.io (apiextensions.k8s.io/v1) cluster
# 2:05:53PM: ---- applying 2 changes [9/12 done] ----
# 2:05:53PM: create secret/secretgen-controller-registry-creds (v1) namespace: secretgen-controller
# 2:05:54PM: create serviceaccount/secretgen-controller-sa (v1) namespace: secretgen-controller
# 2:05:54PM: ---- waiting on 2 changes [9/12 done] ----
# 2:05:54PM: ok: reconcile serviceaccount/secretgen-controller-sa (v1) namespace: secretgen-controller
# 2:05:54PM: ok: reconcile secret/secretgen-controller-registry-creds (v1) namespace: secretgen-controller
# 2:05:54PM: ---- applying 1 changes [11/12 done] ----
# 2:05:56PM: create deployment/secretgen-controller (apps/v1) namespace: secretgen-controller
# 2:05:56PM: ---- waiting on 1 changes [11/12 done] ----
# 2:05:56PM: ongoing: reconcile deployment/secretgen-controller (apps/v1) namespace: secretgen-controller
# 2:05:56PM:  ^ Waiting for 1 unavailable replicas
# 2:05:56PM:  L ok: waiting on replicaset/secretgen-controller-6cc64c5b59 (apps/v1) namespace: secretgen-controller
# 2:05:56PM:  L ongoing: waiting on pod/secretgen-controller-6cc64c5b59-hp5nf (v1) namespace: secretgen-controller
# 2:05:56PM:     ^ Pending: ContainerCreating
# 2:06:14PM: ok: reconcile deployment/secretgen-controller (apps/v1) namespace: secretgen-controller
# 2:06:14PM: ---- applying complete [12/12 done] ----
# 2:06:14PM: ---- waiting complete [12/12 done] ----

# Succeeded

kubectl get ns
# NAME                        STATUS   AGE
# default                     Active   11m
# kapp-controller             Active   4m31s
# kube-node-lease             Active   11m
# kube-public                 Active   11m
# kube-system                 Active   11m
# secretgen-controller        Active   3m56s
# tanzu-cluster-essentials    Active   4m46s
# tanzu-package-repo-global   Active   4m30s

 kubectl get pods -o wide  -A
# NAMESPACE              NAME                                    READY   STATUS    RESTARTS   AGE     IP            NODE                                NOMINATED NODE   READINESS GATES
# kapp-controller        kapp-controller-b758cfddd-gsnjz         1/1     Running   0          4m46s   10.244.0.10   aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            aks-link-6fdc95f8dc-4drpt               1/1     Running   0          11m     10.244.0.6    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            aks-link-6fdc95f8dc-q4p7h               1/1     Running   0          11m     10.244.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            azure-ip-masq-agent-tkhvc               1/1     Running   0          10m     10.240.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            cloud-node-manager-jns27                1/1     Running   0          10m     10.240.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            coredns-69c47794-lctbw                  1/1     Running   0          11m     10.244.0.5    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            coredns-69c47794-qxh49                  1/1     Running   0          9m16s   10.244.0.9    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            coredns-autoscaler-7d56cd888-sndn5      1/1     Running   0          11m     10.244.0.7    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            csi-azuredisk-node-l2npn                3/3     Running   0          10m     10.240.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            csi-azurefile-node-92g2x                3/3     Running   0          10m     10.240.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            kube-proxy-6jn7m                        1/1     Running   0          10m     10.240.0.4    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            metrics-server-6576d9ccf8-2x2rm         1/1     Running   0          11m     10.244.0.8    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            omsagent-rs-566874fff7-7zpvg            1/1     Running   0          11m     10.244.0.3    aks-agentpool-41996453-vmss000000   <none>           <none>
# kube-system            omsagent-v986f                          2/2     Running   0          10m     10.244.0.2    aks-agentpool-41996453-vmss000000   <none>           <none>
secretgen-controller   secretgen-controller-6bcbbbb7b6-29gnn   1/1     Running   0          4m11s   10.244.0.11   aks-agentpool-41996453-vmss000000   <none>           <none>

#Install the kapp CLI onto your $PATH:
sudo cp $HOME/tanzu-cluster-essentials/kapp /usr/local/bin/kapp

#install all plugins
tanzu plugin install --local cli all
# Installing plugin 'package:v0.11.1'
# Installing plugin 'secret:v0.11.1'
# Installing plugin 'apps:v0.4.1'
# Installing plugin 'accelerator:v1.0.1'
# Installing plugin 'services:v0.1.1'
# ✔  successfully installed 'all' plugin