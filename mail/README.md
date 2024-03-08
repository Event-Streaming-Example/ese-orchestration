# [ESE-Mailer](https://github.com/Event-Streaming-Example/ese-mailer)

This components serves to send emails whenever it is invoked.

```shell
 docker-compose up -p ese-mailer -d
```

- **ESE Role:** Executor for an logic dictated by ese-consumer
- **Talks to:** ESE-Consumer by consuming messages the latter puts into the former's queue
- **Number of instances:** 1
- **Stack:** Java, Spring-Boot, [RabbitMQ](https://www.rabbitmq.com/docs/documentation)

The Queue stats are hosted at <http://localhost:15672>. The username and password for login is _guest_

The UI for the inbox is hosted at <http://localhost:8025>
