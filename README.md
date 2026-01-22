# xcodebuild-mcp Homebrew Tap

MCP server for Xcode build operations - enables AI-powered iOS/macOS development workflows.

## Installation

```bash
brew tap redne-w/xcodebuild-mcp
brew install xcodebuild-mcp
```

## Usage

After installation, configure Claude Code to use the server by adding to `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "xcodebuild": {
      "type": "stdio",
      "command": "xcodebuild-mcp"
    }
  }
}
```

## More Information

See the main repository for documentation: https://github.com/redne-w/xcodebuild-mcp
