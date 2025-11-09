
# Use lightweight Python 3.11
FROM python:3.11


# Install git, curl and other essentials
RUN apt-get update && apt-get install -y git curl && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x and npm for Node-based MCP tools (e.g., Context7, BrightData)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs


# Install uv (uvx)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

# Set working directory
WORKDIR /app

# Clone MCPO repo locally
RUN git clone https://github.com/open-webui/mcpo.git /app/open-webui/mcpo

# Copy MCP configuration and environment variables
COPY mcp_config.json /app/mcp_config.json
COPY .env /app/.env

# Expose the port MCPO will run on
EXPOSE 8002

# Start MCPO using uvx from local path with environment variables
CMD ["sh", "-c", "source /app/.env && ~/.local/bin/uvx /app/open-webui/mcpo --port 8002 --config /app/mcp_config.json"]
