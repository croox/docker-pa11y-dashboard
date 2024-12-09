# docker-pa11y-dashboard

Docker image for [pa11y-dashboard](https://github.com/pa11y/pa11y-dashboard).

Docker Hub: https://hub.docker.com/r/croox/pa11y-dashboard

## Tags

- 4.2.0
- latest

## Pulling the latest image

```bash
docker run --rm -p 127.0.0.1:4000:4000 -d croox/pa11y-dashboard:latest
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
