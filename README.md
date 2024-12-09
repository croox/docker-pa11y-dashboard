# docker-pa11y-dashboard

Docker image for [pa11y-dashboard](https://github.com/pa11y/pa11y-dashboard).

Docker Hub: https://hub.docker.com/r/croox/pa11y-dashboard

## Tags

- 4.2.0
- latest

## Running the latest image

```bash
docker run --rm -p 127.0.0.1:4000:4000 -d croox/pa11y-dashboard:latest
```

## Docker Compose

```yaml
---

volumes:
  mongodb_data:

services:
  mongodb:
    container_name: mongodb
    image: mongo:latest
    volumes:
      - mongodb_data:/data/db
    restart: unless-stopped

  pa11y:
    container_name: pa11y
    image: croox/pa11y-dashboard:4.2.0
    environment:
      - NODE_ENV=production
    depends_on:
      - mongodb
    restart: unless-stopped
    ports:
      - 4000:4000
```

## Using a custom configuration

The configuration used in this images is:

```json
{
    "port": 4000,
    "noindex": true,
    "readonly": false,
    "webservice": {
        "database": "mongodb://mongodb/pa11y-dashboard",
        "host": "0.0.0.0",
        "port": 3000,
        "cron": "0 30 0 * * *",
        "chromeLaunchConfig": {
            "args": [
                "--no-sandbox"
            ]
        }
    }
}
```

To use a custom configuration, create a production.json file and run the container with the -v flag to mount the configuration file.

```bash
docker run --name pa11y-dashboard --rm -d -v $(pwd)/production.json:/opt/pa11y-dashboard/production.json croox/pa11y-dashboard:latest
```
