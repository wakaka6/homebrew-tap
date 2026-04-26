# Homebrew Tap

Personal Homebrew tap for `wakaka6` projects.

## Casks

### MacGesture

```bash
brew install --cask wakaka6/tap/mac-trackpad-gestures
```

MacGesture is a menu bar utility for configurable macOS trackpad gestures.

## Formulae

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
