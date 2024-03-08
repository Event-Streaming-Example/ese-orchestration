# [ESE-Consumer](https://github.com/Event-Streaming-Example/ese-consumer)

Our consumer in this example is someone who wants to get events from the client in near-realtime and perform some logic on top of it.

- **ESE Role:** Consume events and perform operations on it
- **Talks to:** ESE-Server to get the events
- **Number of instances:** 1

```bash
docker run -d -p 8501:8501 --name ese-consumer saumyabhatt10642/ese-consumer
```

- **Stack:** Python, [Streamlit](https://docs.streamlit.io/get-started) App
- **Nature:** Currently polls for events from ese-server to get _near-real-time_ events
- **Hosted at:** <http://localhost:8501>
