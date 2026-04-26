cask "mac-trackpad-gestures" do
  version "4.1.0"
  sha256 "fcdfefd8788a3c48540d0a477d6b43b28022a977c111d35b3c7c73bb60276355"

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
