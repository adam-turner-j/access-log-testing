FROM elastic/logstash:7.6.2

COPY ./logstash.conf /usr/share/logstash/logstash-custom.conf
