FROM ckan/ckan-base:2.11

USER root

RUN apt-get update && apt-get install -y patch

COPY ckanext-dcatapit /srv/app/src/ckanext-dcatapit
RUN chown -R ckan:ckan-sys /srv/app/src/ckanext-dcatapit

# NON FUNZIONA CON IL CLAIM 0
RUN mkdir -p /var/lib/ckan/i18n && chown -R ckan:ckan-sys /var/lib/ckan

# Install the extension as root
RUN pip install -e /srv/app/src/ckanext-dcatapit

COPY apply_patches.sh /apply_patches.sh
RUN chmod +x /apply_patches.sh
RUN bash /apply_patches.sh || echo "Patches failed"

USER ckan

ENTRYPOINT ["/usr/local/bin/ckan", "run"]
