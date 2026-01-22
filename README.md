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

## Updating Formula

After a new release, run:

```bash
./update_formula.sh 0.2.0
git add Formula/xcodebuild-mcp.rb
git commit -m "Update xcodebuild-mcp to 0.2.0"
git push
```

## More Information

See the main repository for documentation: https://github.com/redne-w/xcodebuild-mcp
