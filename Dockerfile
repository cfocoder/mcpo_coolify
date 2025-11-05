# Use lightweight Python 3.11
FROM python:3.11

# Install curl and other essentials
RUN apt-get update && apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install uv (uvx)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Set working directory
WORKDIR /app

# Copy MCP configuration
COPY mcp_config.json /app/mcp_config.json

# Expose the port MCPO will run on
EXPOSE 8002

# Start MCPO using uvx
CMD ["sh", "-c", "~/.local/bin/uvx open-webui/mcpo --port 8002 --config /app/mcp_config.json"]
