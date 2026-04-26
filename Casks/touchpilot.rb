cask "touchpilot" do
  version "0.1.0"
  sha256 "ac1b9590bc1781891f4a104ee22d03bd7aa3dff36893c84a836b77c1a222b98e"

  url "https://github.com/wakaka6/touchpilot/releases/download/v#{version}/TouchPilot-#{version}.dmg"
  name "TouchPilot"
  desc "Custom multi-finger trackpad gestures for macOS"
  homepage "https://github.com/wakaka6/touchpilot"

  depends_on macos: ">= :monterey"

  app "TouchPilot.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/TouchPilot.app"],
                   sudo: false
  end

  uninstall quit: "com.wakaka6.touchpilot"

  zap trash: "~/Library/Preferences/com.wakaka6.touchpilot.plist"
end
