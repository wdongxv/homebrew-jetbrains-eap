cask "webstorm-eap" do
  arch arm: "-aarch64"

  version "2023.1,231.7515.16"
  sha256 arm: "4ee3550e422c165e5a883efb4f15953b5f4e3b60206e942da745ca5653e94b95",
         intel: "f2b97f86576c98ca7f8262bac4c6fdf701de3d0359dc0f76ab737a234b8577fd"

  url "https://download.jetbrains.com/webstorm/WebStorm-#{version.csv.last}#{arch}.dmg"
  name "WebStorm-EAP"
  desc "JavaScript IDE - WebStorm Early Access Program"
  homepage "https://www.jetbrains.com/webstorm/nextversion/"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=WS&latest=true&type=eap"
    strategy :page_match do |page|
      JSON.parse(page)["WS"].map do |release|
        "#{release["version"]},#{release["build"]}"
      end
    end
  end  

  app "WebStorm #{version.csv.first} EAP.app"
end
