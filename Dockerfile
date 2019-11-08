FROM websphere-liberty:microProfile3

COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options
COPY --chown=1001:0 target/acmeair-customerservice-java-3.0.war /config/apps/

RUN configure.sh || if [ $? -ne 22 ]; then exit $?; fi
