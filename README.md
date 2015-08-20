To create the VM with all ELK stack:

```bash
vagrant up elk
```

To output Docker logs to syslog and from there to LogStash:

```bash
vagrant up docker-node
```

ElasticSearch: [http://localhost:9200/_search?pretty](http://localhost:9200/_search?pretty)
Kibana: [http://localhost:5601/](http://localhost:5601/)

TODO
====

* Create collectd container
* Write collectd + ELK article
* Link to the ELK article


```bash
## collectd ##
sudo apt-get update
sudo apt-get install -y collectd collectd-utils

## elasticsearch ##
sudo mkdir -p /data/elasticsearch
sudo docker run -d --name elasticsearch -p 9200:9200 -v /data/elasticsearch:/usr/share/elasticsearch/data elasticsearch
    
## logstash ##
sudo docker run -d --name logstash --expose 25826 -p 25826:25826 -p 25826:25826/udp -v $PWD/conf:/conf --link elasticsearch:db logstash logstash -f /conf/logstash_collectd.conf

## restart collectd ##
sudo cp /vagrant/conf/collectd.conf /etc/collectd/collectd.conf
sudo service collectd restart

## kibana ##
sudo docker run -d --name kibana -p 5601:5601 --link elasticsearch:elasticsearch kibana
```