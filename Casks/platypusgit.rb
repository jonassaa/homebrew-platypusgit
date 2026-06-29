cask "platypusgit" do
  version :latest
  sha256 :no_check

  url "https://github.com/jonassaa/platypusgit/releases/latest/download/PlatypusGit_universal.dmg"
  name "PlatypusGit"
  desc "Cross-platform, developer-focused git desktop app"
  homepage "https://github.com/jonassaa/platypusgit"

  app "PlatypusGit.app"

  # The app is ad-hoc signed but NOT notarized (no paid Apple Developer
  # account). Install with `--no-quarantine` so Gatekeeper does not block it:
  #   brew install --cask --no-quarantine platypusgit
  # A postflight `xattr` strip would work too, but arbitrary-code stanzas force
  # third-party taps to require `brew trust`, so we avoid it.
  caveats <<~EOS
    PlatypusGit is ad-hoc signed but not notarized. If you did not install with
    `--no-quarantine`, clear the Gatekeeper flag once:
      xattr -dr com.apple.quarantine "#{appdir}/PlatypusGit.app"
  EOS

  zap trash: [
    "~/Library/Application Support/io.github.jonassaa.platypusgit",
    "~/Library/Caches/io.github.jonassaa.platypusgit",
    "~/Library/Preferences/io.github.jonassaa.platypusgit.plist",
    "~/Library/Saved Application State/io.github.jonassaa.platypusgit.savedState",
  ]
end
