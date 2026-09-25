cask "insomnium" do
  version "0.3.0-rc.18"
  sha256 "985cc5a16dbe1603188f9ae936db31fe52835051f6c8298dfb91eaf7b2518599"

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

  zap trash: [
    "~/Library/Application Support/Insomnium",
    "~/Library/Application Support/insomnium-app",
    "~/Library/Logs/Insomnium",
    "~/Library/Preferences/com.insomnium.app.plist",
    "~/Library/Saved Application State/com.insomnium.app.savedState",
  ]
end
