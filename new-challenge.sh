#!/bin/bash

# Check if challenge name provided
if [ -z "$1" ]; then
    echo "Usage: ./new-challenge.sh <challenge-name>"
    echo "Example: ./new-challenge.sh variables"
    exit 1
fi

CHALLENGE_NAME=$1
CHALLENGE_DIR="./challenges/$CHALLENGE_NAME"

# Create challenge folder and initialize
mkdir -p "$CHALLENGE_DIR"
pushd "$CHALLENGE_DIR" > /dev/null || exit 1
cargo init --bin --name "$CHALLENGE_NAME"
popd > /dev/null || exit 1

# Create empty main.rs (remove default content)
echo "" > "$CHALLENGE_DIR/src/main.rs"

echo "✓ Created challenge: $CHALLENGE_NAME"
echo "  Location: $CHALLENGE_DIR"
echo "  Next steps:"
echo "    1. Edit $CHALLENGE_DIR/src/main.rs"
echo "    2. Run: cargo run -p $CHALLENGE_NAME"