cask "platypusgit" do
  version "0.3.1"
  sha256 "ca522a2777c529de32899b8de09d4617d83508c722565e8d433f6d533992dad1"

  url "https://github.com/jonassaa/platypusgit/releases/download/v#{version}/PlatypusGit_universal.dmg"
  name "platypusgit"
  desc "Cross-platform, developer-focused git desktop app"
  homepage "https://github.com/jonassaa/platypusgit"

  app "platypusgit.app"
  binary "#{appdir}/platypusgit.app/Contents/MacOS/platypusgit", target: "pgit"

  # The app is ad-hoc signed but NOT notarized (no paid Apple Developer
  # account), so Gatekeeper quarantines it. Strip the flag on install.
  # Homebrew 6.0.0 requires `brew trust` for ALL third-party tap casks
  # regardless of arbitrary-code stanzas, so this postflight adds no extra
  # trust cost there. On older Homebrew it reintroduces a trust prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/platypusgit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/io.github.jonassaa.platypusgit",
    "~/Library/Caches/io.github.jonassaa.platypusgit",
    "~/Library/Preferences/io.github.jonassaa.platypusgit.plist",
    "~/Library/Saved Application State/io.github.jonassaa.platypusgit.savedState",
  ]
end
