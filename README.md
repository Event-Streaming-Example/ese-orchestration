# ese-orchestration

This repo houses all the required configs as to how to orchestrate the FE, BE and other components for a demo. One can use this to understand how the overall architecure would look like. Recommended order of setup would be as follows:

1. [ESE-Server](https://github.com/Event-Streaming-Example/ese-server)
2. [ESE-Consumer](https://github.com/Event-Streaming-Example/ese-consumer)
3. [ESE-Client](https://github.com/Event-Streaming-Example/ese-client)

![ESE Servers docker compose overview](./images/ese-servers-dc.png)

---

<br>

## Setting up ESE-Servers

Our ESE-Servers act as the bridge from the entity that produces events (ese-client) and the one that wants to use it (ese-consumer). We shall be exposing them behind a LB and shard them according to the traffic.

```bash
docker-compose -f ./docker/ese-server.compose.yml -p ese-backend up -d
```

- **ESE Role:** Publishes events, received from the client for others to use
- **Talks to:** ESE-Client to accept events
- **Number of instances:** 3

<br>

- **Server stack:** [Gin](https://gin-gonic.com/docs/) server written in Go
- **Deployment:** 3 servers (sharded) serving behind a [HA-Proxy](https://www.haproxy.com/documentation/) Load Balancer
- **LB Algorithm:** Least Connection
- **Shard distribution:** 2 will handle traffic from ese-clients, 1 from ese-consumer

### Observability

We shall be using [Prometheus](https://prometheus.io/docs/introduction/overview/) to collect and store service level metrics and display them onto a [Grafana](https://grafana.com/docs/) Dashboard. The steps are as follows:

1. Navigate to the Grafana dashboard at `http://localhost:3000`.
2. Provide the username and password as `admin`.
3. Choose prometheus as your data source and provide the URL: `http:prometheus-server:9090`
4. Choose the import dashboard option and upload the [ESE Server Grafana Dashboard.json](./observability/ESE%20Server%20Grafana%20Dashboard.json) file.

Real time stats of the connections at the load balancer could be found at `http://localhost:8100/stats`.

---

<br>

## Setting up ESE-Consumer

Our consumer in this example is someone who wants to get events from the client in realtime.

```bash
docker run -it -p 8501:8501 --name ese-consumer saumyabhatt10642/ese-consumer
```

- **ESE Role:** Consume events and perform operations on it
- **Talks to:** ESE-Server to get the events
- **Number of instances:** 1

<br>

- **Stack:** Python, [Streamlit](https://docs.streamlit.io/get-started) App
- **Nature:** Currently polls for events from ese-server to get _near-real-time_ events
- **Hosted at:** `http://localhost:8501`

---

<br>

## Setting up ESE-Clients

We shall be simulating the generation of events from the clients at a fixed interval. Make sure to change the required configs for the same in the [.env](./configs/.env) file.

```bash
docker-compose -f ./docker/ese-client.compose.yml -p ese-frontend up -d
```

- **ESE Role:** Generating of events
- **Talks to:** ESE-Server over REST calls
- **Number of instances:** 4

<br>

- **Library Used:** React
- **Deployment:** Serving static files from a [NGINX](https://nginx.org/en/docs/) server
