LogStash
========

To build:

```bash
sudo docker build -t vfarcic/logstash .
```

To run LogStash:

```bash
export CONF_PATH=$PWD/logstash.conf
export LOGS_DIR=$PWD/logs
export PATTERNS_DIR=$PWD/patterns
sudo docker run -d --name logstash \
  -v $CONF_PATH:/ls/logstash.conf \
  -v $LOGS_DIR:/ls/logs \
  -v $PATTERNS_DIR:/ls/patterns \
  -p 5000:5000 \
  vfarcic/logstash
```

To run LogStash linked to the ElasticSearch container:

```bash
export CONF_PATH=$PWD/logstash.conf
export LOGS_DIR=$PWD/logs
export PATTERNS_DIR=$PWD/patterns
sudo docker run -d --name logstash \
  --link elasticsearch:db \
  -v $CONF_PATH:/ls/logstash.conf \
  -v $LOGS_DIR:/ls/logs \
  -v $PATTERNS_DIR:/ls/patterns \
  vfarcic/logstash
```

To output Docker logs to syslog and from there to LogStash (works only in Docker 1.6+:

```bash
echo "*.* @localhost:25826" | sudo tee /etc/rsyslog.d/10-logstash.conf
sudo service rsyslog restart

# Start a container that produces some logs to stdout/stderr
sudo docker run -d --name bdd \
  -p 9000:9000 \
  --log-driver=syslog \
  vfarcic/bdd

# Start LogStash
export CONF_PATH=$PWD/syslog.conf
sudo docker run -d --name logstash \
  -v $CONF_PATH:/ls/logstash.conf \
  -p 25826:25826 \
  -p 25826:25826/udp \
  vfarcic/logstash
```