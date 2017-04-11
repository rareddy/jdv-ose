# jdv-ose-dba

#### To import an image and create the template in fresh openshift environment like CDK or 'oc cluster up'
```
oc create -n openshift -f is.json
oc create  -n openshift -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/datavirt/datavirt63-extensions-support-s2i.json
oc -n openshift import-image jboss-datavirt63-openshift
```

#### Login into a Openshift instance
```
oc login ce-os-rhel-master.usersys.redhat.com:8443
```

#### Create a new project
```
oc new-project jdv-demo
```

#### Create a service account and security certificates, secrets 
#### only in demo
```
oc create -f datavirt-app-secret.yaml
```
or
#### in prod situations
```
oc create serviceaccount datavirt-service-account
oc secrets new datavirt-app-secret keystore.jks jgroups.jceks

# to delete
#oc delete secret datavirt-app-secret
#oc delete serviceaccount datavirt-service-account
#oc delete secret datavirt-app-config
```
#### Create secret for the data sources
```
oc secrets new datavirt-app-config datasources.properties
```

Now Log into https://ce-os-rhel-master.usersys.redhat.com:8443/console
choose "jdv-demo", add to project

- Pick "datavirt63-extensions-support-s2i" template
- Provide "Git Repository URL" to the where the VDBs are
- Provide "Extensions Git Repository URL" to where your "modules" and driver definitions are.
- Clear out "Context Directory" for both
- Provide "Teiid Username" and "Teiid User Password" make sure password adheres to password rules defined.
- If you created custom certificates, all the passwords and certificate names need to be filled out
- Click create and wait..

once pods are active, you can issue a command like
```
curl -H "Host: datavirt-app-jdv-demo.router.default.svc.cluster.local" -u "teiidUser:redhat1!" http://10.34.75.115/odata/sqlserver/$metadata
```
