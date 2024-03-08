# [ESE-Clients](https://github.com/Event-Streaming-Example/ese-client)

**NOTE:** Make sure to change the environment variable `REACT_APP_SERVER_URL` accordingly in the .env file for it to point to the correct backend (It should be pointing to the Load Balancer)

- **ESE Role:** Generating of events
- **Talks to:** ESE-Server over REST calls
- **Number of instances:** 4

- **Library Used:** React
- **Deployment:** Serving static files from a [NGINX](https://nginx.org/en/docs/) server

## Standalone Client

In this setup, only one instance of the client will be spun up and will talk to the backend. This can be used for demonstration purpose

```shell
docker run -d -p 8080:80 --env-file .env --name ese-client-standalone saumyabhatt10642/ese-client
```

The UI is hosted at <http://localhost:8080>

## Simulate Clients

In this setup, focus will be given more on simulating traffice. Hence there is no UI to be displayed. However, we shall be spinining up 4 instance of the client to send traffic to the backend

```shell
docker-compose -p ese-clients up -d
```
