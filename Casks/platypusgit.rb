cask "platypusgit" do
  version :latest
  sha256 :no_check

  url "https://github.com/jonassaa/platypusgit/releases/latest/download/PlatypusGit_universal.dmg"
  name "PlatypusGit"
  desc "Cross-platform, developer-focused git desktop app"
  homepage "https://github.com/jonassaa/platypusgit"

  app "PlatypusGit.app"

  # The app is ad-hoc signed but NOT notarized (no paid Apple Developer
  # account). Strip the Gatekeeper quarantine flag so it launches without the
  # "unidentified developer" / "app is damaged" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PlatypusGit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/io.github.jonassaa.platypusgit",
    "~/Library/Caches/io.github.jonassaa.platypusgit",
    "~/Library/Preferences/io.github.jonassaa.platypusgit.plist",
    "~/Library/Saved Application State/io.github.jonassaa.platypusgit.savedState",
  ]
end
