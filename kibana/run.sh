#!/bin/bash

echo "define(['settings'],
function (Settings) {
  return new Settings({
    elasticsearch: '$DB_PORT',
    default_route     : '/dashboard/file/default.json',
    kibana_index: 'kibana-int',
    panel_names: [
      'histogram',
      'map',
      'goal',
      'table',
      'filtering',
      'timepicker',
      'text',
      'hits',
      'column',
      'trends',
      'bettermap',
      'query',
      'terms',
      'stats',
      'sparklines'
    ]
  });
});" >/usr/share/nginx/html/config.js
nginx -c /etc/nginx/nginx.conf -g "daemon off;"