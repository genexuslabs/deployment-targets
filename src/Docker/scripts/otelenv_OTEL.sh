#OpenTelemetry Configuration

echo "GeneXus - Setting OpenTelemetry environment variables for Tomcat"

export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/usr/local/tomcat/lib/opentelemetry-javaagent.jar"