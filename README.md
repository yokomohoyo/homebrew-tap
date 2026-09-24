# yokomohoyo/homebrew-tap

Homebrew tap for [Insomnium](https://github.com/yokomohoyo/insomnium), an actively maintained, 100% local and privacy-focused fork of Insomnia.

## Install

```sh
brew install --cask yokomohoyo/tap/insomnium
```

The fully-qualified name (`yokomohoyo/tap/insomnium`) is required because Homebrew core also ships a now-deprecated `insomnium` cask pointing at the original upstream; without the prefix `brew` resolves to that one.

Since 0.3.0-rc.15 the macOS app is signed with a Developer ID certificate and notarized by Apple, and the cask keeps Homebrew's normal Gatekeeper quarantine. The first time you open Insomnium, macOS asks whether you want to open an app downloaded from the Internet; click Open. `brew upgrade` carries that approval over to new versions.

Upgrading from 0.3.0-rc.14 or earlier (unsigned builds), `brew upgrade` prints `Homebrew couldn't verify insomnium's signer so macOS may prompt at next launch.` once. That is expected, and the next launch shows the same one-time prompt.

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
