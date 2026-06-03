cask "insomnium" do
  version "0.2.3-a"
  sha256 "f13bddd11c2d4b65ca9b238026c30d1c6022fdf91f89324f1ced8688270690e3"

  url "https://github.com/yokomohoyo/insomnium/releases/download/V.01-test/Insomnium.Core-#{version}.dmg",
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
