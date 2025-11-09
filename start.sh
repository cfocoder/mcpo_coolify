#!/bin/bash

# Export environment variables that Coolify provides
export BANXICO_API_TOKEN="${BANXICO_API_TOKEN}"
export PERPLEXITY_API_KEY="${PERPLEXITY_API_KEY}"

# Start MCPO
exec ~/.local/bin/uvx /app/open-webui/mcpo --port 8002 --config /app/mcp_config.json