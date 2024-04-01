FROM confluentinc/cp-kafka:latest

WORKDIR /setup

COPY entrypoint.sh ./

USER root
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
