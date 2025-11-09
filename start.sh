#!/bin/bash

# Create a temporary config file with substituted environment variables
envsubst < /app/mcp_config.json > /app/mcp_config_processed.json

# Start MCPO with the processed config file
exec ~/.local/bin/uvx /app/open-webui/mcpo --port 8002 --config /app/mcp_config_processed.json