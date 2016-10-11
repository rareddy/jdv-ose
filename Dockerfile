FROM scratch

LABEL Name="jboss-datavirt-6/jdv-extensions" \
      Version="latest" \
      Release="latest" \
      Architecture="x86_64" 

#COPY injected-files /injected/injected-files
COPY injected-modules /injected-modules
COPY install.sh /install.sh
COPY install.properties /install.properties

