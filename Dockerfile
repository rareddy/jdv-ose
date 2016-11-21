FROM scratch

LABEL Name="jdv-example" \
      Version="latest"

COPY files /extensions/
COPY modules /extensions/modules/
COPY install.sh /extensions/
COPY install.properties /extensions/

