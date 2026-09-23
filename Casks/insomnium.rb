cask "insomnium" do
  version "0.3.0-rc.12"
  sha256 "89c0274b6f7b2e8e25694e3d13d4ce312bc4a0606dde687b465a958a3b72ad9a"

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
