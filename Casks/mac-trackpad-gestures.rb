cask "mac-trackpad-gestures" do
  version "4.1.0"
  sha256 "6ebadc3b81f428b0d559dcb0076006526f21e3d362feb21f26b4314be2f8c802"

  url "https://github.com/wakaka6/mac-trackpad-gestures/releases/download/v#{version}/MacGesture-#{version}.dmg"
  name "MacGesture"
  desc "Configurable trackpad gestures for copy, paste, and shortcuts"
  homepage "https://github.com/wakaka6/mac-trackpad-gestures"

  depends_on macos: ">= :monterey"

  app "MacGesture.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MacGesture.app"],
                   sudo: false
  end

  uninstall quit: "com.macgesture.app"

  zap trash: "~/Library/Preferences/com.macgesture.app.plist"
end
