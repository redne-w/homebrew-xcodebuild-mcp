#!/bin/bash

set -e

REPO="redne-w/xcodebuild-mcp"
FORMULA_PATH="$(dirname "$0")/Formula/xcodebuild-mcp.rb"

usage() {
    echo "Usage: $0 <version>"
    echo "Example: $0 0.1.0"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

VERSION="$1"

# Validate version format
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version should be in format x.y.z (e.g., 0.1.0)"
    exit 1
fi

echo "Fetching release info for version v$VERSION..."

# Download tarball and compute SHA256
TARBALL_URL="https://github.com/$REPO/releases/download/v$VERSION/xcodebuild-mcp-v$VERSION-macos.tar.gz"
SHA256=$(curl -sL "$TARBALL_URL" | shasum -a 256 | cut -d ' ' -f 1)

if [ -z "$SHA256" ] || [ "$SHA256" = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" ]; then
    echo "Error: Failed to download release or release is empty"
    echo "URL: $TARBALL_URL"
    exit 1
fi

echo "Found release:"
echo "  Version: $VERSION"
echo "  SHA256: $SHA256"

# Check if formula file exists
if [ ! -f "$FORMULA_PATH" ]; then
    echo "Error: Formula file not found at $FORMULA_PATH"
    exit 1
fi

echo "Updating formula..."

# Update version
sed -i '' "s/version \"[^\"]*\"/version \"$VERSION\"/" "$FORMULA_PATH"

# Update URL
sed -i '' "s|download/v[^/]*/xcodebuild-mcp-v[^-]*-macos|download/v$VERSION/xcodebuild-mcp-v$VERSION-macos|" "$FORMULA_PATH"

# Update SHA256
sed -i '' "s/sha256 \"[^\"]*\"/sha256 \"$SHA256\"/" "$FORMULA_PATH"

echo "Formula updated successfully!"
echo ""
echo "Next steps:"
echo "  git add Formula/xcodebuild-mcp.rb"
echo "  git commit -m 'Update xcodebuild-mcp to $VERSION'"
echo "  git push"
