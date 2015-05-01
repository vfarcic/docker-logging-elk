ElasticSearch
=============

To run the ElasticSearch container:

```bash
sudo docker run -d vfarcic/elasticsearch
```

To run ElasticSSearch container with data stored on the host and port defined:

```bash
export DATA_DIR=/data/elasticsearch
export PORT=9200
sudo docker run -d --name elasticsearch \
  -v $DATA_DIR:/opt/elasticsearch/data \
  -p $PORT:9200 \
  vfarcic/elasticsearch
```

Open [http://localhost:9200/_search?pretty](http://localhost:9200/_search?pretty) in your favourite browser to see stored data (change 9200 to the port Docker exposed).