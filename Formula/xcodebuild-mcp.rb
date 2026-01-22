class XcodebuildMcp < Formula
  desc "MCP server exposing xcodebuild and simctl operations for AI assistants"
  homepage "https://github.com/redne-w/xcodebuild-mcp"
  url "https://github.com/redne-w/xcodebuild-mcp/releases/download/v0.1.0/xcodebuild-mcp-v0.1.0-macos.tar.gz"
  sha256 "29e97094ea9cff8c1476ec9e2a7e0db75cdf0193f4fe8bfe0ad136d172141d88"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    bin.install "xcodebuild-mcp"
  end

  def caveats
    <<~EOS
      To use with Claude Code, add to ~/.claude/settings.json:

        {
          "mcpServers": {
            "xcodebuild": {
              "type": "stdio",
              "command": "#{opt_bin}/xcodebuild-mcp"
            }
          }
        }
    EOS
  end
end
