#!/usr/bin/env bash
set -euo pipefail

# Delete a single pod to demonstrate Kubernetes self-healing.
# In production we'd use controlled chaos tooling, but this is enough to show recovery mechanics.

NAMESPACE="demo"
APP_LABEL="app.kubernetes.io/instance=demo-service"

POD=$(kubectl -n "${NAMESPACE}" get pods -l "${APP_LABEL}" -o jsonpath='{.items[0].metadata.name}')

if [[ -z "${POD}" ]]; then
  echo "No pod found. Is demo-service deployed?"
  exit 1
fi

echo "Deleting pod: ${POD}"
kubectl -n "${NAMESPACE}" delete pod "${POD}"

echo "Watching for replacement... (Ctrl+C to stop)"
kubectl -n "${NAMESPACE}" get pods -l "${APP_LABEL}" -w
