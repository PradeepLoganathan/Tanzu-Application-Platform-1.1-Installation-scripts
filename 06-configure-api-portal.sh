tanzu package available list -n tap-install api-portal.tanzu.vmware.com

# | Retrieving package versions for api-portal.tanzu.vmware.com... 
#   NAME                         VERSION     RELEASED-AT    
#   api-portal.tanzu.vmware.com  1.0.15      2022-03-31 10:00:00 +1000 AEST  
#   api-portal.tanzu.vmware.com  1.0.8       2021-12-16 10:00:00 +1000 AEST  
#   api-portal.tanzu.vmware.com  1.0.9       2022-01-03 10:00:00 +1000 AEST  
#   api-portal.tanzu.vmware.com  1.0.9+sr.1  2022-03-31 10:00:00 +1000 AEST  

tanzu package available get -n tap-install api-portal.tanzu.vmware.com/1.0.15 --values-schema


tanzu package installed update tap \                                                                                                                               ✔ 
 -p api-portal.tanzu.vmware.com \
 -v 1.0.15 \
 -n tap-install \
 -f tap-install-api-portal-1.0.15.yaml

 http://tap-gui.tap.mytanzudev.com/supply-chain