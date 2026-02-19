CONTEXT := docker-desktop
NAMESPACE := flock
RELEASE := flock
API_DIR := ../flock-api
BASE_DIR := ../flock-base

KUBECTL := kubectl --context $(CONTEXT) -n $(NAMESPACE)
HELM := helm --kube-context $(CONTEXT) -n $(NAMESPACE)

.PHONY: up down restart status logs build deps

build:
	docker build -t flock-api:latest $(API_DIR)

deps:
	helm dependency update $(BASE_DIR)
	helm dependency update .

up: build deps
	$(KUBECTL) get namespace $(NAMESPACE) > /dev/null 2>&1 || kubectl --context $(CONTEXT) create namespace $(NAMESPACE)
	$(HELM) upgrade --install $(RELEASE) . --wait --timeout 5m

down:
	$(HELM) uninstall $(RELEASE) || true
	kubectl --context $(CONTEXT) delete namespace $(NAMESPACE) --ignore-not-found

restart: build
	$(HELM) upgrade $(RELEASE) . --wait --timeout 5m

logs:
	$(KUBECTL) logs -l app.kubernetes.io/component=api --tail=100 -f

status:
	$(KUBECTL) get pods
