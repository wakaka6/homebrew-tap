cask "touchpilot" do
  version "0.1.0"
  sha256 "e2b6d553da3b02ef6ebc05eba60b0df92e5350d728838083ed12a63cccc20b88"

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
