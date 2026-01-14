# sre-platform-eks-blueprint

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://example.com) [![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE) [![Kubernetes](https://img.shields.io/badge/k8s-v1.25-blue)](https://kubernetes.io/)

This repository is a hands-on **SRE / Platform Engineering lab** designed to demonstrate real-world practices for observability, autoscaling, incident response, and recovery on Kubernetes.

It reflects how reliability engineering is applied in production environments.

---

## 📖 Table of Contents

- [Overview](#overview)
- [Observability Evidence](#-observability-evidence)
- [One-Command Demo](#-one-command-demo)
- [Architecture](#-architecture)
- [Key Features](#-key-features)
- [Repo Structure](#-repo-structure)
- [Setup Instructions](#-setup-instructions)
- [Usage](#-usage)
- [Author](#-author)

---

## 🌟 Overview

This project showcases a production-grade SRE platform built on Kubernetes. Key components include:

- **Kubernetes**: Cluster setup using `kind`.
- **Helm**: Deployment of a Python-based demo service.
- **Terraform**: Infrastructure as code for cloud environments.
- **Observability Stack**: Prometheus, Grafana, and Alertmanager.
- **Chaos Engineering**: Scripts for testing system resilience.
- **Load Testing**: Simulating traffic with `k6`.

---

## 📊 Observability Evidence

The repository includes screenshots from live Grafana dashboards captured during load and scaling tests. These dashboards provide insights into:

- Node-level metrics (CPU, memory, disk)
- Kubernetes workload resource usage
- Requests vs limits validation
- Kubelet performance

Screenshots are stored under `docs/screenshots/`.

---

## 🚀 One-Command Demo

```bash
bash scripts/demo.sh
```

### Prerequisites

- Docker
- `kind` (Kubernetes in Docker)
- `kubectl`

---

## 🏗️ Architecture

![Architecture Diagram](docs/screenshots/architecture-diagram-placeholder.txt)

The platform includes:

- **Kubernetes Cluster**: Managed using `kind`.
- **Observability Stack**: Prometheus, Grafana, and Alertmanager.
- **Demo Service**: Python application deployed via Helm.
- **CI/CD Pipeline**: Automates testing and deployment.

---

## 🔑 Key Features

- **Observability**: Real-time metrics and dashboards.
- **Autoscaling**: Horizontal Pod Autoscaler (HPA) in action.
- **Incident Response**: Alerts and runbooks for troubleshooting.
- **Chaos Engineering**: Resilience testing with failure injection.
- **Load Testing**: Simulate traffic with `k6`.

---

## 📁 Repo Structure

- `apps/`: Demo Python service and Helm chart  
- `platform/`: Observability stack and alerting  
- `tests/`: Load and chaos testing  
- `scripts/`: Helper scripts for demos  
- `docs/`: Runbooks, screenshots, and walkthroughs  

---

## 🛠️ Setup Instructions

### Step 1: Clone the Repository
```bash
git clone https://github.com/charith/sre-platform-eks.git
cd sre-platform-eks
```

### Step 2: Create the Kubernetes Cluster
```bash
kind create cluster --name sre-lab --config platform/kind/kind-config.yaml
```

### Step 3: Deploy the Observability Stack
```bash
kubectl apply -f platform/manifests/
```

### Step 4: Deploy the Demo Service
```bash
helm install demo-service apps/demo-service/chart/
```

### Step 5: Access Grafana
- Port-forward Grafana:
  ```bash
  kubectl -n observability port-forward svc/kube-prometheus-stack-grafana 3000:80
  ```
- Open Grafana at `http://localhost:3000` and log in with the default credentials (`admin`/`admin`).

---

## 🧑‍💻 Usage

### Running Load Tests
```bash
docker run --rm -i grafana/k6 run - < tests/load/k6/http.js
```

### Simulating Chaos
```bash
bash tests/chaos/pod-kill.sh
```

---

## 👤 Author

Charith Kumar
