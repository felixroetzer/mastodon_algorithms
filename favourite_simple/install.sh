#!/bin/bash

echo "🚀 Starting installation of Favourite Simple Feed..."

# Define paths
MASTODON_DIR="$HOME/live"  # Adjust if needed
TARGET_FILE="$MASTODON_DIR/app/models/feed.rb"
BACKUP_FILE="$TARGET_FILE.bak"

# Ensure the Mastodon directory exists
if [ ! -d "$MASTODON_DIR" ]; then
    echo "❌ Error: Mastodon directory not found at $MASTODON_DIR"
    exit 1
fi

# Backup the existing file
if [ -f "$TARGET_FILE" ]; then
    echo "💾 Backing up the existing feed.rb to feed.rb.bak"
    cp "$TARGET_FILE" "$BACKUP_FILE"
fi

# Replace the file
echo "📝 Replacing feed.rb with the custom version"
cp feed.rb "$TARGET_FILE"

echo "✅ Installation complete!"
