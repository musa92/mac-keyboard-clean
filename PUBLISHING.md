# Publishing Guide

## One-time Setup

### 1. Create GitHub Repository
Create a new repository on GitHub named `keyboard-clean` under your account:
- Repository URL: `https://github.com/musa92/keyboard-clean`
- Initialize with this codebase

### 2. Set up Homebrew Tap (Optional)
For a dedicated tap, create a separate repository named `homebrew-keyboard-clean`:
- Repository URL: `https://github.com/musa92/homebrew-keyboard-clean`
- Move the `Formula/` directory contents to this repository

## Release Process

### 1. Prepare Release
```bash
# Ensure all changes are committed
git add .
git commit -m "Prepare v0.1.0 release"
git push origin main
```

### 2. Create and Push Tag
```bash
# Create version tag
git tag v0.1.0
git push origin v0.1.0
```

### 3. Update Formula SHA256
After the GitHub Actions workflow completes:

```bash
# Download the release tarball
curl -L -o v0.1.0.tar.gz https://github.com/musa92/keyboard-clean/archive/refs/tags/v0.1.0.tar.gz

# Calculate SHA256
shasum -a 256 v0.1.0.tar.gz

# Update Formula/keyboard-clean.rb with the calculated hash
```

## User Installation

Users can install the tool using:

```bash
# Install from main repository
brew tap musa92/keyboard-clean
brew install keyboard-clean

# Or if using separate tap repository
brew tap musa92/homebrew-keyboard-clean
brew install keyboard-clean
```

## Usage Examples

```bash
# Default: 10 minutes, display mode
keyboard-clean

# Lock mode with custom duration
keyboard-clean --minutes 5 --mode lock

# With countdown sound
keyboard-clean --sound on --minutes 2

# Get help
keyboard-clean --help
```

## Testing

Test the formula locally before release:

```bash
# Install locally for testing
brew install --build-from-source Formula/keyboard-clean.rb

# Test the installation
keyboard-clean --help

# Uninstall after testing
brew uninstall keyboard-clean
```
