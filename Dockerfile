FROM ubuntu:latest

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

ENV NGINX_VERSION   %%NGINX_VERSION%%
ENV NJS_VERSION     %%NJS_VERSION%%
ENV PKG_RELEASE     %%PKG_RELEASE%%

RUN set -x \
# create nginx user/group first, to be consistent throughout docker variants
    && addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y gnupg1 ca-certificates nginx


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

