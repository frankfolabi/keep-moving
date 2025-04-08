# Multistage Dockerfile for efficiency
# === Stage 1: Builder ===
FROM python:3.11-slim AS builder

WORKDIR /app

# Install dependencies early to leverage Docker layer caching
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Copy the entire app
COPY . .

# === Stage 2: Runtime ===
FROM python:3.11-slim

WORKDIR /app

# Copy only installed packages from builder
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app /app

# Set environment variables so Python uses the installed packages
ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000
CMD ["python", "app.py"]

