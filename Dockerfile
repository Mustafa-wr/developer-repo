FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/app.py .

EXPOSE 8080

# Auto-instrument with OpenTelemetry
CMD ["opentelemetry-instrument", \
     "--traces_exporter", "otlp", \
     "--metrics_exporter", "otlp", \
     "--service_name", "sample-flask-app", \
     "gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "app:app"]
