FROM ckan/ckan-base:2.11

USER root

RUN apt-get update && apt-get install -y patch 

RUN pip install ckanext-dcat 

COPY ckanext-dcatapit /srv/app/src/ckanext-dcatapit
RUN chown -R ckan:ckan-sys /srv/app/src/ckanext-dcatapit 

RUN mkdir -p /var/lib/ckan/i18n && chown -R ckan:ckan-sys /var/lib/ckan 

RUN pip install -e /srv/app/src/ckanext-dcatapit 

COPY new_schema.xml /srv/app/src/ckan/ckan/config/solr/schema.xml

ENTRYPOINT ["/usr/local/bin/ckan", "run"]
