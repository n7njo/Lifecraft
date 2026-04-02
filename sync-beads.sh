#!/bin/bash
# Sync script to fetch the latest beads and dependencies from the remote Dolt server
# This script should be run from the project root.

echo "Syncing beads and dependencies from remote Dolt server..."

# Note: BEADS_DOLT_PASSWORD is expected to be in the environment.
if [ -z "$BEADS_DOLT_PASSWORD" ]; then
  echo "Error: BEADS_DOLT_PASSWORD environment variable not set."
  exit 1
fi

# Ensure output directory exists
mkdir -p internal-docs/src/data

# Export regular issues to JSONL
bd export > internal-docs/src/data/beads.jsonl

# Convert JSONL to a proper JSON array for React import
echo "[" > internal-docs/src/data/beads.json
sed 's/$/,/' internal-docs/src/data/beads.jsonl | sed '$ s/,$//' >> internal-docs/src/data/beads.json
echo "]" >> internal-docs/src/data/beads.json

# Cleanup temp file
rm internal-docs/src/data/beads.jsonl

echo "Successfully synced beads to internal-docs/src/data/beads.json"
