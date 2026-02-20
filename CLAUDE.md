# flock-local

Helm values overrides for running the full Flock platform locally on Docker Desktop Kubernetes (or kind/k3d).

Uses flock-base as the base chart. Single-binary mode with infrastructure subcharts configured for local development.

## Prerequisites

- Docker Desktop with Kubernetes enabled (or kind/k3d)
- Helm 3

## Usage

```bash
helm dependency update
helm install flock . -n flock --create-namespace
```

## What This Provides

A local Flock environment: API (all targets), PostgreSQL — running in your local cluster. More infrastructure added as build phases progress.

## Conventions

- No application code lives here — only Helm values overrides
- Keep resource requests/limits tuned for local development (low memory, no HPA)

## Code Style

- Do NOT write comments that explain what the code does — the code should speak for itself
- Only write comments when explaining **why** something non-obvious is done, or linking to an issue/spec
- No redundant/repetitive comments

## Git Workflow

- Each task gets its own branch off `main`
- Use **conventional commits**: `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `ci:`
- Commit message must reference the GitHub issue: `Closes #N`
- One commit per PR, squash if needed
- Open PR with `gh pr create` and add `--reviewer SyntaxSmith106`
