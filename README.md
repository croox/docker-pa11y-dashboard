# docker-pa11y-dashboard

Docker image for [pa11y-dashboard](https://github.com/pa11y/pa11y-dashboard).

## Tags

- 4.2.0
- latest

## Pulling the latest image

```bash
docker pull ghcr.io/croox/docker-pa11y-dashboard:latest
```

## Running the latest image locally

```bash
docker run --name pa11y-dashboard --rm -d ghcr.io/croox/docker-pa11y-dashboard:latest
```

## Using a custom configuration

To use a custom configuration, create a `production.json` file and run the container with the `-v` flag to mount the configuration file.

```bash
docker run --name pa11y-dashboard --rm -d -v $(pwd)/production.json:/opt/pa11y-dashboard/production.json ghcr.io/croox/docker-pa11y-dashboard:latest
```
