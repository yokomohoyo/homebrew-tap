cask "insomnium" do
  version "0.10.0"
  sha256 "4f5496d89e18b0b99d213bf813b44c295574cbeea7e07b53f715b602e79b2c58"

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
  depends_on macos: :ventura

  app "Insomnium.app"

  zap trash: [
    "~/Library/Application Support/Insomnium",
    "~/Library/Application Support/insomnium-app",
    "~/Library/Logs/Insomnium",
    "~/Library/Preferences/com.insomnium.app.plist",
    "~/Library/Saved Application State/com.insomnium.app.savedState",
  ]
end
