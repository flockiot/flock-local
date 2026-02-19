# flock-local

Helm values overrides for running the full Flock platform locally on Docker Desktop Kubernetes (or kind/k3d).

Uses flock-base as the base chart. Single-binary mode with all infrastructure subcharts enabled and configured for local development.

## Prerequisites

- Docker Desktop with Kubernetes enabled (or kind/k3d)
- Helm 3

## Usage

```bash
helm dependency update
helm install flock . -n flock --create-namespace
```

## What This Provides

A complete local Flock environment: API (all targets), PostgreSQL, Kafka, Redis, ClickHouse, Loki, Harbor, MinIO, Zitadel — all running in your local cluster.

## Conventions

- No application code lives here — only Helm values overrides
- Keep resource requests/limits tuned for local development (low memory, no HPA)
