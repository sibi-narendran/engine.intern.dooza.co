#!/bin/bash
# Update API service to connect to Plugin Daemon
# Usage: ./update-api-for-plugin-daemon.sh <plugin-daemon-railway-url>
# Example: ./update-api-for-plugin-daemon.sh plugin-daemon-production-xxxx.up.railway.app

if [ -z "$1" ]; then
    echo "Usage: $0 <plugin-daemon-railway-url>"
    echo "Example: $0 plugin-daemon-production-xxxx.up.railway.app"
    exit 1
fi

PLUGIN_DAEMON_URL="https://$1"

echo "Updating dify-api service to connect to Plugin Daemon..."
echo "Plugin Daemon URL: $PLUGIN_DAEMON_URL"

railway variables --service dify-api --set "PLUGIN_DAEMON_URL=$PLUGIN_DAEMON_URL"
railway variables --service dify-api --set "PLUGIN_DAEMON_KEY=lYkiYYT6owG+71oLerGzA7GXCgOT++6ovaezWAjpCjf+Sjc3ZtU+qUEi"
railway variables --service dify-api --set "INNER_API_KEY_FOR_PLUGIN=QaHbTe77CtuXmsfyhR7+vRjI/+XbV1AaFy691iy+kGDv2Jvy0/eAh8Y1"

echo ""
echo "✅ API service updated!"
echo "The dify-api service will redeploy automatically."
echo ""
echo "After redeploy, check:"
echo "1. Plugin Daemon logs to ensure it's running"
echo "2. API logs to ensure it can connect to Plugin Daemon"
echo "3. Dify dashboard - 400 errors should be resolved!"

