class JustTalk < Formula
  desc "Desktop voice input tool: global hotkey recording to ASR, clipboard or auto-submit"
  homepage "https://github.com/wakaka6/just-talk-go"
  url "https://github.com/wakaka6/just-talk-go/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "58c6ee1df06d86faa7607c665f783e072ba272653abfc5be48fd8e06964df26a"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    # Native cgo is required on macOS for hotkeys, CoreAudio recording,
    # clipboard, auto-submit, and the notch overlay.
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", "-trimpath", "-ldflags", "-s -w",
           "-o", bin/"just-talk", "./cmd/just-talk"
  end

  def caveats
    <<~EOS
      just-talk needs permission granted to the terminal app that launches it
      (Terminal, iTerm2, etc.):

        * Accessibility: System Settings > Privacy & Security > Accessibility
        * Microphone:    System Settings > Privacy & Security > Microphone

      Configure your Doubao/Volcengine ASR credentials in
      ~/.config/just-talk/config.toml ([voice] app_key / access_key) or via the TUI.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/just-talk --help 2>&1", 2)
  end
end
