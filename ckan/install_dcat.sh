#!/bin/bash

source /usr/lib/ckan/default/bin/activate

pip install -e git+https://github.com/ckan/ckanext-dcat.git#egg=ckanext-dcat

pip install -r /tmp/ckanext-dcat/requirements.txt

PLUGINS_TO_ADD="dcat dcat_rdf_harvester structured_data"

echo "Old plugins: $CKAN__PLUGINS"

ckan config-tool $CKAN_INI "ckan.plugins = $CKAN__PLUGINS $PLUGINS_TO_ADD"

echo "New plugins: $CKAN__PLUGINS $PLUGINS_TO_ADD"