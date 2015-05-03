LogSTash
========

To run Kibana linked to the ElasticSearch container:

```bash
export PORT=9201
sudo docker run -d --name kibana \
  -p $PORT:5601 \
  --link elasticsearch:db \
  vfarcic/kibana
```