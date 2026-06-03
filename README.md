# yokomohoyo/homebrew-tap

Homebrew tap for [Insomnium](https://github.com/yokomohoyo/insomnium), an actively maintained, 100% local and privacy-focused fork of Insomnia.

## Install

```sh
brew tap yokomohoyo/tap
brew install --cask insomnium
```

The macOS build is currently distributed unsigned, so the cask strips the Gatekeeper quarantine attribute after install. Once a Developer ID cert is wired into the release workflow, that postflight will be removed.

## Update

```sh
brew update
brew upgrade --cask insomnium
```

## Uninstall

```sh
brew uninstall --cask insomnium
brew untap yokomohoyo/tap
```
