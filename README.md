# keyboard-clean

A tiny macOS utility that gives you a safe **keyboard cleaning mode**:

- **display**: turn screen off immediately, keep Mac awake for N minutes
- **lock**: lock the session first, then keep Mac awake for N minutes

No drivers. No HID hacks.

## Install

```bash
brew tap musa92/keyboard-clean
brew install keyboard-clean
```

## Usage

```bash
# 10 minutes, screen off (default)
keyboard-clean

# 5 minutes, lock first
keyboard-clean --minutes 5 --mode lock

# 2 minutes, with countdown beeps
SOUND=on keyboard-clean --minutes 2
```

## Options

- `--minutes N` - Set cleaning window duration in minutes (default: 10)
- `--mode display|lock` - Choose between display off or lock screen (default: display)
- `--sound on|off` - Enable countdown beeps (default: off)

## Why this approach?

While some apps try to "eat" key events, the safest general method is:

1. Turn the display off or lock the session
2. Keep the system "user active" so it won't deep-sleep during your wipe

## License

MIT
