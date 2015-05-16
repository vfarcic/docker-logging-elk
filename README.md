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

TODO: Export Kibana settings
TODO: Try rsyslog to remote server
TODO: Rename to docker-logging