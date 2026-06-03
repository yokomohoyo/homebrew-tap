# yokomohoyo/homebrew-tap

Homebrew tap for [Insomnium](https://github.com/yokomohoyo/insomnium), an actively maintained, 100% local and privacy-focused fork of Insomnia.

## Install

```sh
brew install --cask yokomohoyo/tap/insomnium
```

The fully-qualified name (`yokomohoyo/tap/insomnium`) is required because Homebrew core also ships a now-deprecated `insomnium` cask pointing at the original upstream; without the prefix `brew` resolves to that one.

The macOS build is currently distributed unsigned, so the cask strips the Gatekeeper quarantine attribute after install. Once a Developer ID cert is wired into the release workflow, that postflight will be removed.

## Update

```sh
brew update
brew upgrade --cask yokomohoyo/tap/insomnium
```

## Uninstall

```sh
brew uninstall --cask yokomohoyo/tap/insomnium
brew untap yokomohoyo/tap
```
