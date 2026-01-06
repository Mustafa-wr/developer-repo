# Sample Flask Application

Developer repository for the sample Flask application deployed on Falcon Platform with OpenTelemetry observability.

## Features

- ✅ Flask REST API
- ✅ Automatic OpenTelemetry instrumentation
- ✅ CI/CD with GitHub Actions
- ✅ GitOps deployment pattern
- ✅ Distributed tracing to OTLP collector

## Structure


```
.
├── src/
│   └── app.py              # Application code
├── Dockerfile              # Container image with OTel auto-instrumentation
├── requirements.txt        # Python + OpenTelemetry dependencies
└── .github/workflows/
    └── deploy.yaml         # CI/CD pipeline
```

## OpenTelemetry Integration

This app automatically exports traces and metrics using OpenTelemetry auto-instrumentation.

**Required Environment Variables** (set in Kubernetes deployment):
```bash
OTEL_EXPORTER_OTLP_ENDPOINT=http://otel-collector:4317
OTEL_SERVICE_NAME=sample-flask-app
```

The platform's OTel collector receives traces and exports to Prometheus/Grafana.

## Developer Workflow

1. **Make code changes** in `src/app.py`
2. **Commit and push** to main branch
3. **GitHub Actions automatically**:
   - Builds Docker image with OTel
   - Pushes to Docker Hub
   - Updates platform GitOps repo
4. **ArgoCD automatically** deploys to Kubernetes
5. **Traces appear** in Grafana automatically

## Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run locally
python src/app.py

# Test
curl http://localhost:8080
```

## Build and Test Locally

```bash
# Build Docker image
docker build -t sample-flask-app:local .

# Run container
docker run -p 8080:8080 sample-flask-app:local

# Test
curl http://localhost:8080
```

## Secrets Required

Add these secrets to the GitHub repository:

- `DOCKERHUB_USERNAME` - Docker Hub username
- `DOCKERHUB_TOKEN` - Docker Hub access token
- `PLATFORM_REPO_TOKEN` - GitHub PAT with access to platform repo
# Testing
