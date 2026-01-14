#!/usr/bin/env bash
set -euo pipefail

# Apply dashboard configmap after kube-prometheus-stack is installed.
kubectl apply -f platform/observability/dashboards-configmap.yaml
echo "Dashboards configmap applied. Grafana should pick them up within ~30 seconds."
