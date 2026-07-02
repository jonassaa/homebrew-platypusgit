# homebrew-platypusgit

Homebrew tap for [PlatypusGit](https://github.com/jonassaa/platypusgit).

## Install

```bash
brew install --cask jonassaa/platypusgit/platypusgit
```

The fully-qualified name auto-taps, so no separate `brew tap` step.

The app is ad-hoc signed but not notarized (no paid Apple Developer account).
A cask `postflight` strips the macOS Gatekeeper quarantine flag on install, so
it launches with no "unidentified developer" prompt — no `--no-quarantine` or
manual `xattr` needed.

On Homebrew 6.0.0+, all third-party tap casks require a one-time trust grant;
`brew install` prompts for it interactively (or run `brew trust --cask
jonassaa/platypusgit/platypusgit` first).

## Update

```bash
brew upgrade --cask platypusgit
```

The cask pins an explicit version, so a normal `brew upgrade` picks up new
releases once the tap is updated.

## Uninstall

```bash
brew uninstall --cask platypusgit       # remove app
brew uninstall --zap --cask platypusgit # remove app + app data
```
