#!/bin/bash

echo "🚀 Starting installation of Second-Degree Feed..."

# Define paths
MASTODON_DIR="$HOME/live"  # Adjust if needed
TARGET_FILE="$MASTODON_DIR/app/models/home_feed.rb"
BACKUP_FILE="$TARGET_FILE.bak"

# Ensure the Mastodon directory exists
if [ ! -d "$MASTODON_DIR" ]; then
    echo "❌ Error: Mastodon directory not found at $MASTODON_DIR"
    exit 1
fi

# Backup the existing file
if [ -f "$TARGET_FILE" ]; then
    echo "💾 Backing up the existing home_feed.rb to home_feed.rb.bak"
    cp "$TARGET_FILE" "$BACKUP_FILE"
fi

# Replace the file
echo "📝 Replacing home_feed.rb with the custom version"
cp ./app/models/home_feed.rb "$TARGET_FILE"

echo "✅ Installation complete!"
