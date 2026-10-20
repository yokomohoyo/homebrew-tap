cask "insomnium" do
  version "0.5.0"
  sha256 "a3a5a0a8607916dd09dfa2f2f38ee9ac054ad8d74ea489d81bd1a4c567cc7823"

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
