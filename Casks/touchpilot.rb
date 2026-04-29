cask "touchpilot" do
  version "0.2.1"
  sha256 "1b0c22e72de9727bd833cdd75fec0af31ff3a6bf39716aa31c363bf8493f9585"

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
