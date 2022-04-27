kubectl get all -n tanzu-system-ingress

# NAME                           READY   STATUS    RESTARTS   AGE
# pod/contour-5fd9569f58-7svnw   1/1     Running   0          21m
# pod/contour-5fd9569f58-xrln7   1/1     Running   0          21m
# pod/envoy-vnw2j                2/2     Running   0          21m

# NAME              TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
# service/contour   ClusterIP      10.0.46.53     <none>        8001/TCP                     21m
# service/envoy     LoadBalancer   10.0.220.249   20.227.8.36   80:32380/TCP,443:32068/TCP   21m

# NAME                   DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
# daemonset.apps/envoy   1         1         1       1            1           <none>          21m

# NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/contour   2/2     2            2           21m

# NAME                                 DESIRED   CURRENT   READY   AGE
# replicaset.apps/contour-5fd9569f58   2         2         2       21m

Kubectl get ns

# NAME                        STATUS   AGE
# accelerator-system          Active   13h
# api-portal                  Active   13h
# app-live-view               Active   14h
# app-live-view-connector     Active   14h
# app-live-view-conventions   Active   13h
# build-service               Active   13h
# cartographer-system         Active   13h
# cert-injection-webhook      Active   13h
# cert-manager                Active   14h
# conventions-system          Active   13h
# default                     Active   14h
# developer-conventions       Active   13h
# flux-system                 Active   13h
# image-policy-system         Active   13h
# kapp-controller             Active   14h
# knative-eventing            Active   13h
# knative-serving             Active   13h
# knative-sources             Active   13h
# kpack                       Active   13h
# kube-node-lease             Active   14h
# kube-public                 Active   14h
# kube-system                 Active   14h
# metadata-store              Active   13h
# scan-link-system            Active   13h
# secretgen-controller        Active   14h
# service-bindings            Active   13h
# services-toolkit            Active   13h
# source-system               Active   13h
# spring-boot-convention      Active   13h
# stacks-operator-system      Active   13h
# tanzu-cluster-essentials    Active   14h
# tanzu-package-repo-global   Active   14h
# tanzu-system-ingress        Active   14h
# tap-gui                     Active   13h
# tap-install                 Active   14h
# tap-telemetry               Active   14h
# tekton-pipelines            Active   13h
# triggermesh                 Active   13h
# vmware-sources              Active   13h