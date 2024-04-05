# Apache Superset dashboard

## Introduction
This project provides a Docker Compose configuration for Apache Superset along with Redis and PostgreSQL containers. This setup enables users to embed Superset dashboards within external web applications using iframes.

## Prerequisites
- Docker installed on your system.

## Setup

**Install Docker**: If Docker is not installed on your system, follow the steps below:

- *Linux*: [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- *macOS*: [Install Docker Desktop on Mac](https://docs.docker.com/desktop/install/)
- *Windows*: [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

**Setup Environment Variables**:

- Rename `.env.sample` to `.env`.
- Update secret values inside `.env`.
- Set environment variables with the following command:
```bash
$ source .env
```

Create base64 secrets
```bash
$ echo $(openssl rand -base64 42)
```

## Usage

**Run Superset Locally**:
Set docker lock permission on vm
```bash
$ chmod 666 /var/run/docker.sock
```
Start the Docker container by running the following command:
```bash
$ docker compose up -d
```

Kill all local containers
```bash
$ docker rm -f $(docker ps -a -q)
```