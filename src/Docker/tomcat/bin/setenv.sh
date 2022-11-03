echo "GeneXus - Setting custom environment variables for Tomcat"

export CATALINA_OPTS="$CATALINA_OPTS -XX:+UseConcMarkSweepGC"
export CATALINA_OPTS="$CATALINA_OPTS -XX:HeapDumpPath=/logs/tomcat/java_heapdump_pid_%p.log"
export CATALINA_OPTS="$CATALINA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
export CATALINA_OPTS="$CATALINA_OPTS -Djava.awt.headless=true"

if [ -r "$CATALINA_BASE/bin/otelenv.sh" ]; then
  . "$CATALINA_BASE/bin/otelenv.sh"
fi
