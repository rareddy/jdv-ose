Any files go here. you can define directories here, note that the path in resource-adapters needs to be relative to this root directory. During the image creation, these files will be copied into the image. Typically in production environment, you want mount a NFS drive to the OpenShift environment, and then use that mount in your resource-adapter. This is another way to provide the files ad-hoc, but note these can not updated once deployed. To able to have them available in the image you need to create a secret by executing the following command

oc secrets new jdv-app-data jdv-ose-dba/mounted-files/
oc volume dc/jdv-app --add --name=data --mount-path=/files --type=secret --secret-name=jdv-app-data
