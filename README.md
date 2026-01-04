# Sample Flask Application

Developer repository for the sample Flask application deployed on Falcon Platform.

## Structure


```
.
├── src/
│   └── app.py              # Application code
├── Dockerfile              # Container image definition
├── requirements.txt        # Python dependencies
└── .github/workflows/
    └── deploy.yaml         # CI/CD pipeline
```

## Developer Workflow

1. **Make code changes** in `src/app.py`
2. **Commit and push** to main branch
3. **GitHub Actions automatically**:
   - Builds Docker image
   - Pushes to Docker Hub
   - Updates platform GitOps repo
4. **ArgoCD automatically** deploys to Kubernetes

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
