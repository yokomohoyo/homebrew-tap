cask "insomnium" do
  version "0.3.0-rc.5"
  sha256 "753b4b198a9af3494e09fcec5ef625d3a98832fe3cda1e4a531f27ba342ae093"

  url "https://github.com/yokomohoyo/insomnium/releases/download/0.3.0-rc.5/Insomnium.Core-#{version}.dmg",
      verified: "github.com/yokomohoyo/insomnium/"
  name "Insomnium"
  desc "100% local, privacy-focused fork of Insomnia (REST / GraphQL / gRPC client)"
  homepage "https://github.com/yokomohoyo/insomnium"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :catalina"

  app "Insomnium.app"

  # The macOS build is currently unsigned (no Apple Developer cert wired into CI).
  # Strip the quarantine attribute so Gatekeeper lets the app launch without
  # users having to right-click → Open. Remove this block once the build is
  # signed + notarized (CSC_LINK + notarize-action in release-on-publish.yml).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", "#{appdir}/Insomnium.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Insomnium",
    "~/Library/Application Support/insomnium-app",
    "~/Library/Logs/Insomnium",
    "~/Library/Preferences/com.insomnium.app.plist",
    "~/Library/Saved Application State/com.insomnium.app.savedState",
  ]
end
