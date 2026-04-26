cask "touchpilot" do
  version "0.1.0"
  sha256 "a7f2484bbf5f9cb319bcaa44389277ec091cfd55f5cc7a47b84c3d68fd8f1dee"

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
