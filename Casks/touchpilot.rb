cask "touchpilot" do
  version "0.2.0"
  sha256 "5970b6c81c3e2b6552da657e4d8be05a6d04ac446daf2ac3f7a561c8b6db5172"

  url "https://github.com/wakaka6/touchpilot/releases/download/v#{version}/TouchPilot-#{version}.dmg"
  name "TouchPilot"
  desc "Custom multi-finger trackpad gestures"
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
