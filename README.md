# Homebrew Tap

Personal Homebrew tap for `wakaka6` projects.

## Casks

### TouchPilot

```bash
brew install --cask wakaka6/tap/touchpilot
```

TouchPilot is a menu bar utility for configurable macOS trackpad gestures.

## Formulae

### just-talk

```bash
brew install wakaka6/tap/just-talk
```

Desktop voice input tool: a global hotkey records audio, streams it to ASR, and
copies the recognized text to the clipboard or submits it into the focused input
field. Requires Accessibility and Microphone permissions for the terminal app
that launches it. See the
[project README](https://github.com/wakaka6/just-talk-go) for setup details.

### claude-code-relay

```bash
brew install wakaka6/tap/claude-code-relay
```

After installation, configure the service:

```bash
cp $(brew --prefix)/etc/cc-relay-server/config.example.toml ~/.config/cc-relay-server/config.toml
```

Edit the config file with your API credentials, then start manually:

```bash
cc-relay-server --config ~/.config/cc-relay-server/config.toml
```

Or use Homebrew services:

```bash
brew services start claude-code-relay
```
