#!/usr/bin/env bash
set -euo pipefail

# Test script for keyboard-clean
# This validates the tool without actually running the cleaning mode

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KEYBOARD_CLEAN="${SCRIPT_DIR}/scripts/keyboard-clean"

echo "Testing keyboard-clean utility..."

# Test 1: Help output
echo "Test 1: Help output"
if "$KEYBOARD_CLEAN" --help | grep -q "keyboard-clean v"; then
    echo "✓ Help output contains version information"
else
    echo "✗ Help output missing or incorrect"
    exit 1
fi

# Test 2: Invalid argument handling
echo "Test 2: Invalid argument handling"
if ! "$KEYBOARD_CLEAN" --invalid-arg 2>/dev/null; then
    echo "✓ Invalid arguments are rejected properly"
else
    echo "✗ Invalid arguments should be rejected"
    exit 1
fi

# Test 3: Script is executable
echo "Test 3: Script permissions"
if [[ -x "$KEYBOARD_CLEAN" ]]; then
    echo "✓ Script is executable"
else
    echo "✗ Script is not executable"
    exit 1
fi

echo "All tests passed!"
echo ""
echo "To test actual functionality (carefully):"
echo "  ./scripts/keyboard-clean --minutes 1 --mode display"
