# homebrew-platypusgit

Homebrew tap for [PlatypusGit](https://github.com/jonassaa/platypusgit).

## Install

```bash
brew tap jonassaa/platypusgit
brew install --cask --no-quarantine platypusgit
```

The app is ad-hoc signed but not notarized (no paid Apple Developer account).
`--no-quarantine` tells Homebrew not to apply the macOS Gatekeeper flag, so it
launches with no "unidentified developer" prompt. The cask carries no
arbitrary-code stanzas, so no `brew trust` is required.

## Update

```bash
brew upgrade --cask --greedy platypusgit
```

The cask tracks the `latest` GitHub release, so `--greedy` is needed to
reinstall the newest build.

## Uninstall

```bash
brew uninstall --cask platypusgit       # remove app
brew uninstall --zap --cask platypusgit # remove app + app data
```
