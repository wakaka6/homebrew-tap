class ClaudeCodeRelay < Formula
  desc "High-performance AI API relay service for Claude, Gemini, and OpenAI"
  homepage "https://github.com/wakaka6/claude-code-relay"
  url "https://github.com/wakaka6/claude-code-relay/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a73ec49af76352d0276afe5ced773a08f3e06db81a31bc2303fb54fe9db7c171"
  license "MIT"
  head "https://github.com/wakaka6/claude-code-relay.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/relay-server")

    (etc/"cc-relay-server").mkpath
    etc.install "config.example.toml" => "cc-relay-server/config.example.toml"
  end

  def post_install
    (var/"cc-relay-server").mkpath

    config_file = etc/"cc-relay-server/config.toml"
    unless config_file.exist?
      config_example = etc/"cc-relay-server/config.example.toml"
      if config_example.exist?
        cp config_example, config_file
        inreplace config_file, 'database_path = "data/relay.db"',
                  "database_path = \"#{var}/cc-relay-server/relay.db\""
      end
    end
  end

  def caveats
    <<~EOS
      Configuration file: #{etc}/cc-relay-server/config.toml
      Data directory: #{var}/cc-relay-server/

      Edit the config file with your API credentials before starting.

      To start manually:
        cc-relay-server --config #{etc}/cc-relay-server/config.toml

      To start as a service:
        brew services start claude-code-relay
    EOS
  end

  service do
    run [opt_bin/"cc-relay-server", "--config", etc/"cc-relay-server/config.toml"]
    keep_alive true
    working_dir var/"cc-relay-server"
    log_path var/"log/cc-relay-server.log"
    error_log_path var/"log/cc-relay-server.log"
  end

  test do
    assert_match "cc-relay-server", shell_output("#{bin}/cc-relay-server --help", 2)
  end
end
