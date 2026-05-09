#!/bin/bash

set -e

APP_DIR="/opt/apps"

echo "=================================="
echo "Starting deployment"
echo "=================================="

cd $APP_DIR

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
npm install

echo "Building application..."
npm run build

echo "Reloading PM2 cluster gracefully..."
pm2 reload ecosystem.config.js

echo "Waiting for application health..."

MAX_RETRIES=30
COUNT=0

until curl -f http://localhost:3000/api/health > /dev/null 2>&1
do
    COUNT=$((COUNT+1))

    if [ $COUNT -eq $MAX_RETRIES ]; then
        echo "Health check FAILED"
        exit 1
    fi

    echo "Waiting for app to become healthy..."
    sleep 10
done

echo "Health check PASSED"

echo "=================================="
echo "Deployment successful"
echo "=================================="
