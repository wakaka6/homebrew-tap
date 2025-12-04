# Homebrew Tap

This is a Homebrew tap for [claude-code-relay](https://github.com/wakaka6/claude-code-relay).

## Installation

```bash
brew tap wakaka6/tap
brew install claude-code-relay
```

## Usage

After installation, configure the service:

```bash
cp $(brew --prefix)/etc/cc-relay-server/config.example.toml ~/.config/cc-relay-server/config.toml
```

Edit the config file with your API credentials, then start the service:

```bash
cc-relay-server --config ~/.config/cc-relay-server/config.toml
```

Or use Homebrew services:

```bash
brew services start claude-code-relay
```
