FROM nginx:alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10

ENV APP_HOME=/usr/share/nginx/html
ENV CONF_HOME=/etc/nginx/conf.d

COPY ./app/index.html $APP_HOME/index.html
COPY ./app/50x.html $APP_HOME/50x.html
COPY ./app/default.conf $CONF_HOME/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
