FROM elastic/logstash:7.6.2

COPY ./logstash.conf /usr/share/logstash/pipeline/logstash.conf
COPY ./log4j2.properties /usr/share/logstash/config/log4j2.properties
