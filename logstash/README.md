LogSTash
========

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