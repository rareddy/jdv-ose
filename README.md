# jdv-ose-dba

oc new-project jdv-demo
oc delete secret datavirt-app-secret
oc delete serviceaccount datavirt-service-account
oc create -f datavirt-app-secret.yaml

oc delete secret datavirt-app-config
oc secrets new datavirt-app-config datasources.properties

curl -H "Host: datavirt-app-jdv-demo.router.default.svc.cluster.local" -u "teiidUser:redhat1!" http://10.34.75.115/odata/sqlserver/$metadata
