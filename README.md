# MCPO Coolify Deployment

This repository contains everything needed to deploy the MCPO (Model Context Protocol OpenAPI Proxy) using Docker and Coolify.

## What is MCPO?
MCPO is a proxy server that exposes MCP tool servers as OpenAPI-compatible HTTP endpoints, making them accessible to LLM agents and applications.

## What is Coolify?
Coolify is an open-source self-hosted platform for automated deployment and management of web apps, databases, and services. It supports Dockerfile-based builds and integrates with GitHub for seamless CI/CD.

## Quick Start


### 1. Fork and Clone the Repository
It is recommended to **fork** this project on GitHub. This allows you to customize the MCP tools in `mcp_config.json` for your own use case.

```bash
git clone https://github.com/<your-username>/mcpo_coolify.git
cd mcpo_coolify
```

### 2. Review/Edit the Dockerfile
The provided `Dockerfile` installs all dependencies, clones MCPO, and sets up the config file.

### 3. Edit Configuration
Update `mcp_config.json` to define your MCP tool servers. Example:
```json
{
  "mcpServers": {
    "time": {
      "command": "uvx",
      "args": ["mcp-server-time", "--local-timezone=America/New_York"]
    }
  }
}
```

### 4. Push to GitHub
Commit and push your changes to your GitHub repository.

### 5. Deploy on Coolify
- Create a new Web App in Coolify.
- Connect your GitHub repo.
- Select the branch and set build method to Dockerfile.
- Set environment variables if needed.
- Deploy.

### 6. Access Your App
Coolify will provide a public URL. For MCPO, you’ll see the OpenAPI Proxy UI and endpoints.

## Environment Variables
Store secrets and API keys in a `.env` file and set them in Coolify for security. Do not commit secrets to the repo.

## Notes
- For multi-service setups, use Docker Compose locally, but prefer Dockerfile for Coolify deployments.
- For other apps, adjust the Dockerfile and config as needed.

## License
MIT
