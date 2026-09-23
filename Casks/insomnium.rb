cask "insomnium" do
  version "0.3.0-rc.11"
  sha256 "664f6034404f8594ae1cfbec79fb3b74f0144e7916e798ba41f7084e9389a58a"

  url "https://github.com/yokomohoyo/insomnium/releases/download/#{version}/Insomnium.Core-#{version}.dmg"
  name "Insomnium"
  desc "100% local, privacy-focused fork of Insomnia (REST / GraphQL / gRPC client)"
  homepage "https://github.com/yokomohoyo/insomnium"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-rc\.\d+)?)$/i)
    strategy :github_latest
  end

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Insomnium.app"

  # The macOS build is currently unsigned (no Apple Developer cert wired into CI).
  # Strip the quarantine attribute so Gatekeeper lets the app launch without
  # users having to right-click → Open. Remove this block once the build is
  # signed + notarized (CSC_LINK + notarize-action in release-on-publish.yml).
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-d", "-r", "com.apple.quarantine", "{{appdir}}/Insomnium.app"],
        must_succeed:   false,
        writable_paths: ["Insomnium.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/Insomnium",
    "~/Library/Application Support/insomnium-app",
    "~/Library/Logs/Insomnium",
    "~/Library/Preferences/com.insomnium.app.plist",
    "~/Library/Saved Application State/com.insomnium.app.savedState",
  ]
end
