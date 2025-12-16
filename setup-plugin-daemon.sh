#!/bin/bash
# Setup script for Dify Plugin Daemon on Railway
# Run this after creating the plugin-daemon service in Railway dashboard

echo "Setting up Plugin Daemon environment variables..."

# Database connection (using internal Railway hostnames)
railway variables --service plugin-daemon --set "DB_TYPE=postgresql"
railway variables --service plugin-daemon --set "DB_HOST=postgres.railway.internal"
railway variables --service plugin-daemon --set "DB_PORT=5432"
railway variables --service plugin-daemon --set "DB_USERNAME=postgres"
railway variables --service plugin-daemon --set "DB_PASSWORD=DVHzVBVyLgGKbegjtbfDrQuaRRijPCJt"
railway variables --service plugin-daemon --set "DB_DATABASE=railway"

# Redis connection (using internal Railway hostnames)
railway variables --service plugin-daemon --set "REDIS_HOST=redis.railway.internal"
railway variables --service plugin-daemon --set "REDIS_PORT=6379"
railway variables --service plugin-daemon --set "REDIS_PASSWORD=iquemiWGvpKLVAbXHnMdEgAsRfFIyGEF"

# Server settings
railway variables --service plugin-daemon --set "SERVER_PORT=5002"
railway variables --service plugin-daemon --set "SERVER_KEY=lYkiYYT6owG+71oLerGzA7GXCgOT++6ovaezWAjpCjf+Sjc3ZtU+qUEi"

# Storage settings
railway variables --service plugin-daemon --set "PLUGIN_STORAGE_TYPE=local"
railway variables --service plugin-daemon --set "PLUGIN_STORAGE_LOCAL_ROOT=/app/storage"
railway variables --service plugin-daemon --set "PLUGIN_WORKING_PATH=/app/storage/cwd"
railway variables --service plugin-daemon --set "PLUGIN_INSTALLED_PATH=plugin"
railway variables --service plugin-daemon --set "PLUGIN_PACKAGE_CACHE_PATH=plugin_packages"

# Dify API connection (using internal Railway URL)
railway variables --service plugin-daemon --set "PLUGIN_DIFY_INNER_API_URL=http://dify-api.railway.internal:5001"
railway variables --service plugin-daemon --set "PLUGIN_DIFY_INNER_API_KEY=QaHbTe77CtuXmsfyhR7+vRjI/+XbV1AaFy691iy+kGDv2Jvy0/eAh8Y1"

echo "Plugin Daemon environment variables set!"
echo ""
echo "Next steps:"
echo "1. In Railway dashboard, set the Plugin Daemon service:"
echo "   - Image: langgenius/dify-plugin-daemon:0.5.1-local"
echo "   - Port: 5002"
echo "2. After the service is deployed, get its Railway URL"
echo "3. Update dify-api service with:"
echo "   - PLUGIN_DAEMON_URL=https://<plugin-daemon-railway-url>"
echo "   - PLUGIN_DAEMON_KEY=lYkiYYT6owG+71oLerGzA7GXCgOT++6ovaezWAjpCjf+Sjc3ZtU+qUEi"

