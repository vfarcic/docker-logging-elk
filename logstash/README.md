LogSTash
========

To run LogStash linked to the ElasticSearch container:

```bash
export CONF_PATH=$PWD/logstash.conf
export LOGS_DIR=$PWD/logs
sudo docker run -d --name logstash \
  --link elasticsearch:db \
  -v $CONF_PATH:/opt/logstash/logstash.conf \
  -v $LOGS_DIR:/opt/logstash/logs \
  vfarcic/logstash
```