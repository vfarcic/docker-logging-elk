LogSTash
========

To run the Kibana linked to ElasticSearch container:

```bash
export PORT=9201
sudo docker run -d --name kibana \
  -p $PORT:80 \
  --link elasticsearch:db \
  vfarcic/kibana
```