cask "webstorm-eap" do
  arch arm: "-aarch64"

  version "2023.2,232.6095.12"
  sha256 arm: "f4991a026191c52014386e0c9cd013b4872fcb6a983bf9a299eb048af15e0333",
         intel: "4b76c4057be25702c71a950802a3bb284aa18dea53ca0629fba3d9290c276ee2"

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
