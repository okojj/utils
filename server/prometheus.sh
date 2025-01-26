#!/bin/bash

# Create persistent volume for your data
docker volume create prometheus-data
# Start Prometheus container
sudo docker run \
    -p 9090:9090 \
    -v ./prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus-data:/prometheus \
    prom/prometheus
