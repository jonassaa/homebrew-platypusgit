cask "platypusgit" do
  version "0.0.14"
  sha256 "4b14773ed05f7b4bbb3bfa73fbccdb42cc42a41d1a8d0786ae3b1e7aad7e6d0b"

  url "https://github.com/jonassaa/platypusgit/releases/download/v#{version}/PlatypusGit_universal.dmg"
  name "PlatypusGit"
  desc "Cross-platform, developer-focused git desktop app"
  homepage "https://github.com/jonassaa/platypusgit"

  app "PlatypusGit.app"

  # The app is ad-hoc signed but NOT notarized (no paid Apple Developer
  # account), so Gatekeeper quarantines it. Strip the flag on install.
  # Homebrew 6.0.0 requires `brew trust` for ALL third-party tap casks
  # regardless of arbitrary-code stanzas, so this postflight adds no extra
  # trust cost there. On older Homebrew it reintroduces a trust prompt.
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
