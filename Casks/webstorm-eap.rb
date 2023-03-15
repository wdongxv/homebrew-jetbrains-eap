cask "webstorm-eap" do
  arch arm: "-aarch64"

  version "2023.1,231.8109.51"
  sha256 arm: "37218654af0162cded9b9b0e8d280faa74aa50c6dcf5fa2889b2e9dd9d7a53c3",
         intel: "f1582b42022f5012be34441b1f3e88935739bc4bf4dbd489b5eddb069272d01c"

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
