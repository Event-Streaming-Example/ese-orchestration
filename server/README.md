# [ESE-Servers](https://github.com/Event-Streaming-Example/ese-server)

Our ESE-Servers act as the bridge from the entity that produces events (ese-client) and the one that wants to use it (ese-consumer). We shall be exposing them behind a LB and shard them according to the traffic.

```shell
docker-compose -p ese-servers up -d
```

- **ESE Role:** Publishes events, received from the client for others to use
- **Talks to:** ESE-Client to accept events
- **Number of instances:** 3

- **Server stack:** [Gin](https://gin-gonic.com/docs/) server written in Go
- **Deployment:** 3 servers (sharded) serving behind a [HA-Proxy](https://www.haproxy.com/documentation/) Load Balancer

---

## Sharding and Load Balancing

We shall be having 2 client facing instances that will cater to requests from them. The third one will be used exclusively for serving traffic from the ese-consumer.

- **LB Server:** [HA-Proxy](https://www.haproxy.com/documentation/)
- **LB Algorithm:** Least Connection

Real time stats of the connections at the load balancer could be found at <http://localhost:8100/stats>.

---

## Observability

We shall be using [Prometheus](https://prometheus.io/docs/introduction/overview/) to collect and store service level metrics and display them onto a [Grafana](https://grafana.com/docs/) Dashboard. The steps are as follows:

1. Navigate to the Grafana dashboard at <http://localhost:3000>.
2. Provide the username and password as `admin`.
3. Choose prometheus as your data source and provide the URL: `http:prometheus-server:9090`
4. Choose the import dashboard option and upload the [ESE Server Grafana Dashboard.json](./observability/ESE%20Server%20Grafana%20Dashboard.json) file.
