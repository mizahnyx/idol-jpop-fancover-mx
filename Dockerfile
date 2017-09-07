# https://gist.github.com/brienw/85db445a0c3976d323b859b1cdccef9a
# https://semaphoreci.com/community/tutorials/dockerizing-elixir-and-phoenix-applications

FROM ubuntu
RUN apt-get update && \
    apt-get install -y libssl1.0.0 postgresql-client locales && \
    apt-get autoclean
RUN mkdir -p /app

ARG VERSION=0.0.1
ARG APP=idol_jpop_fancover_mx
ARG PORT=8080

# _build/prod/rel/idol_jpop_fancover_mx/releases/0.0.1/idol_jpop_fancover_mx.tar.gz
COPY _build/prod/rel/${APP}/releases/0.0.1/${APP}.tar.gz /app/${APP}.tar.gz
WORKDIR /app
RUN tar xvzf ${APP}.tar.gz
RUN locale-gen es_MX.UTF-8
ENV LANG es_MX.UTF-8
ENV LANGUAGE es_MX.UTF-8
ENV LC_ALL es_MX.UTF-8
ENV PORT ${PORT}
CMD ["/app/bin/idol_jpop_fancover_mx", "foreground"]
EXPOSE ${PORT}
