
# Use lightweight Python 3.11
FROM python:3.11


# Install git, curl and other essentials (including gettext for envsubst)
RUN apt-get update && apt-get install -y git curl gettext && \
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

# Copy MCP configuration and startup script
COPY mcp_config.json /app/mcp_config.json
COPY start.sh /app/start.sh

# Make startup script executable
RUN chmod +x /app/start.sh

# Expose the port MCPO will run on
EXPOSE 8002

# Start MCPO using the startup script
CMD ["/app/start.sh"]
