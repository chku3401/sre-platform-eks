# demo-service

This is a simple Nginx-based service designed to demonstrate platform behavior, including deployment, scaling, and observability. It serves as an example workload for testing Kubernetes features such as Horizontal Pod Autoscaling (HPA), service discovery, and observability.

---

## 📋 Prerequisites

- A running Kubernetes cluster (e.g., `kind` or a cloud provider).
- Helm installed on your local machine.
- The `demo` namespace created in your cluster:
  ```bash
  kubectl create namespace demo
  ```

---

## 🚀 Deployment

To deploy the demo service, run the following command:

```bash
helm upgrade --install demo-service ./chart -n demo
```

This will install the service in the `demo` namespace using the provided Helm chart.

---

## ✅ Validation

After deploying, verify that the service is running:

1. Check the pods:
   ```bash
   kubectl get pods -n demo
   ```

2. Check the service:
   ```bash
   kubectl get svc -n demo
   ```

3. Port-forward to access the service locally:
   ```bash
   kubectl -n demo port-forward svc/demo-service 8080:80
   ```
   Open your browser and navigate to `http://localhost:8080` to see the Nginx welcome page.

4. Test the service with `curl`:
   ```bash
   curl http://localhost:8080
   ```

---

## 🛠️ Troubleshooting

- **HPA Doesn't Scale**:
  - Ensure the `metrics-server` is installed and running in your cluster.
  - If using `kind`, you may need to manually deploy the `metrics-server`:
    ```bash
    kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
    ```

- **Service Not Accessible**:
  - Check if the service is exposed correctly:
    ```bash
    kubectl describe svc demo-service -n demo
    ```
  - Ensure there are no network policies blocking access.

- **Pods Not Starting**:
  - Check the pod logs for errors:
    ```bash
    kubectl logs -n demo <pod-name>
    ```
  - Verify that the Helm chart values are correct.

---

This service is intentionally simple to focus on demonstrating platform features like observability and scaling. It can be extended to include additional endpoints or functionality as needed.
