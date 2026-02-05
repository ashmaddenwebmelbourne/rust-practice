#!/bin/bash

set -e

# Check if challenge name provided
if [ -z "$1" ]; then
    echo "Usage: ./new-challenge.sh <challenge-name>"
    echo "Example: ./new-challenge.sh hello_world"
    exit 1
fi

CHALLENGE_NAME=$1
mkdir -p "./challenges"
CHALLENGE_DIR="./challenges/$CHALLENGE_NAME"

# Create Cargo project in workspace (no nested git repo)
cargo new --vcs=none --name "$CHALLENGE_NAME" "$CHALLENGE_DIR"

echo "✓ Created challenge: $CHALLENGE_NAME"
echo "  Location: $CHALLENGE_DIR"
echo ""
echo "Next steps:"
echo "  cd $CHALLENGE_DIR && cargo run"

# If sourced, change to the directory
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    : # Not sourced, do nothing
else
    cd "$CHALLENGE_DIR" || exit 1
    echo ""
    echo "You are now in the project directory!"
    echo "Start coding: edit src/main.rs"
    echo "To run: cargo run"
fi